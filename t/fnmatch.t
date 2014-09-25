use strict;
use warnings;

use Test::More;
use Text::Gitignore qw(match_gitignore);

subtest 'match filename' => sub {
    my (@matched) = match_gitignore(['Documentation/*.html'], 'Documentation/git.html');

    is_deeply \@matched, ['Documentation/git.html'];
};

subtest 'not match subdirs' => sub {
    my (@matched) =
      match_gitignore(['Documentation/*.html'], 'Documentation/ppc/ppc.html',
        'tools/perf/Documentation/perf.html');

    is_deeply \@matched, [];
};

done_testing;
