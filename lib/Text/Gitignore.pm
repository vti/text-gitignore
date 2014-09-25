package Text::Gitignore;
use strict;
use warnings;
use base 'Exporter';

our @EXPORT_OK = qw(match_gitignore);
our $VERSION   = "0.01";

use Text::Glob    ();
use File::FnMatch ();

sub match_gitignore {
    my ($patterns, @files) = @_;

    my @neg;
    my @re;
    foreach my $pattern (@$patterns) {
        next if $pattern eq '';
        next if $pattern =~ m/^#/;

        $pattern =~ s{(?:(?<!\\) )+$}{};
        $pattern =~ s{(?:\\ )+$}{ };

        if ($pattern =~ s/^!//) {
            push @neg, qr/$pattern/;
            next;
        }

        if ($pattern =~ s/^\/// || $pattern !~ m/\//) {
            push @re, Text::Glob::glob_to_regex($pattern);
        }
        else {
            push @re, sub {
                File::FnMatch::fnmatch($pattern, $_[0],
                    &File::FnMatch::FNM_PATHNAME);
              }
        }
    }

    my @matched;
    foreach my $file (@files) {
        foreach my $re (@re) {
            my $matched;
            if (ref $re eq 'CODE') {
                $matched++ if $re->($file);
            }
            else {
                $matched++ if $file =~ $re;
            }

            if ($matched && grep { $file =~ $_ } @neg) {
                last;
            }

            if ($matched) {
                push @matched, $file;
                last;
            }
        }
    }

    return @matched;
}

1;
__END__

=encoding utf-8

=head1 NAME

Text::Gitignore - It's new $module

=head1 SYNOPSIS

    use Text::Gitignore;

=head1 DESCRIPTION

Text::Gitignore is ...

=head1 LICENSE

Copyright (C) Viacheslav Tykhanovskyi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Viacheslav Tykhanovskyi E<lt>viacheslav.t@gmail.comE<gt>

=cut

