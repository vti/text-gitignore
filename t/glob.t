use strict;
use warnings;

use Test::More;
use Text::Gitignore qw(match_gitignore);

subtest 'match glob' => sub {
    my (@matched) = match_gitignore(['foo.*'], 'foo.bar');

    is_deeply \@matched, ['foo.bar'];
};

done_testing;
