use strict;
use warnings;

use Test::More;
use Text::Gitignore qw(match_gitignore);

subtest 'include negated files' => sub {
    my (@matched) = match_gitignore(['f*', '!foo'], 'f123', 'foo');

    is_deeply \@matched, ['f123'];
};

subtest 'treat escaped negation as pattern' => sub {
    my (@matched) = match_gitignore(['\!foo'], '!foo');

    is_deeply \@matched, ['!foo'];
};

done_testing;
