# NAME

Text::Gitignore - Match .gitignore patterns

# SYNOPSIS

    use Text::Gitignore qw(match_gitignore);

    my @matched_files = match_gitignore(['pattern1', 'pattern2/*'], @files);

# DESCRIPTION

Text::Gitignore matches \`.gitignore\` patterns. It combines [Text::Glob](https://metacpan.org/pod/Text::Glob) and
[File::FnMatch](https://metacpan.org/pod/File::FnMatch) functionality with several \`.gitignore\`-specific tweaks.

# LICENSE

Copyright (C) Viacheslav Tykhanovskyi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Viacheslav Tykhanovskyi <viacheslav.t@gmail.com>
