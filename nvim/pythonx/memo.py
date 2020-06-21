def var_name(snip):
    text = snip.v.text
    var_name = text.split(' = ')[0]

    snip.rv = var_name


def body(snip):
    text = snip.v.text
    var_name = text.split(' = ')[1]

    snip.rv = var_name

