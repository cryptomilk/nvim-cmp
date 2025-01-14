local str = require "cmp.utils.str"

describe('utils.str', function()

  it('get_word', function()
    assert.are.equal(str.get_word('print'), 'print')
    assert.are.equal(str.get_word('$variable'), '$variable')
    assert.are.equal(str.get_word('print()'), 'print')
    assert.are.equal(str.get_word('["cmp#confirm"]'), '["cmp#confirm"]')
    assert.are.equal(str.get_word('"devDependencies":', string.byte('"')), '"devDependencies')
  end)

  it('strikethrough', function()
    assert.are.equal(str.strikethrough('あいうえお'), 'あ̶い̶う̶え̶お̶')
  end)

  it('remove_suffix', function()
    assert.are.equal(str.remove_suffix('log()', '$0'), 'log()')
    assert.are.equal(str.remove_suffix('log()$0', '$0'), 'log()')
    assert.are.equal(str.remove_suffix('log()${0}', '${0}'), 'log()')
    assert.are.equal(str.remove_suffix('log()${0:placeholder}', '${0}'), 'log()${0:placeholder}')
  end)

end)


