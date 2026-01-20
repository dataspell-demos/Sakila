create aggregate group_concat(unknown) (
    sfunc = _group_concat,
    stype = text
    );

