use strict;
use warnings;

use Test::More;
use Text::Gitignore qw(match_gitignore);

subtest 'match file' => sub {
    my (@matched) = match_gitignore(['/*.c'], 'foo.c');

    is_deeply \@matched, ['foo.c'];
};

subtest 'not match subdirectories' => sub {
    my (@matched) = match_gitignore(['/*.c'], 'foo/bar.c');

    is_deeply \@matched, [];
};

done_testing;
