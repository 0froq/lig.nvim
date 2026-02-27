local Config = require("lig.config")
local Init = require("lig")

before_each(function()
  vim.o.background = "dark"
  vim.cmd.colorscheme("default")
  Config.setup()
  Init.styles = {}
end)

it("did prper init", function()
  assert.same({}, Init.styles)
  assert.same("default", vim.g.colors_name)
  assert.same("dark", vim.o.background)
end)

describe("loading respects vim.o.background", function()
  it("= dark", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("lig")
    assert.same("dark", vim.o.background)
    assert.same("lig-dark", vim.g.colors_name)
  end)

  it("= light", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("lig")
    assert.same("light", vim.o.background)
    assert.same("lig-light", vim.g.colors_name)
  end)

  it("= dark with dark-soft", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("lig-dark-soft")
    assert.same("dark", vim.o.background)
    assert.same("lig-dark-soft", vim.g.colors_name)
  end)

  it("= dark and use lig-light", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("lig-light")
    assert.same("light", vim.o.background)
    assert.same("lig-light", vim.g.colors_name)
  end)

  it("= light and use lig-dark", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("lig-dark")
    assert.same("dark", vim.o.background)
    assert.same("lig-dark", vim.g.colors_name)
  end)

  it("= light with lig-light-soft", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("lig-light-soft")
    assert.same("light", vim.o.background)
    assert.same("lig-light-soft", vim.g.colors_name)
  end)

  it(" and switches to light", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("lig-dark")
    vim.o.background = "light"
    assert.same("light", vim.o.background)
    assert.same("lig-light", vim.g.colors_name)
  end)

  it(" and switches to dark", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("lig-dark")
    vim.o.background = "dark"
    assert.same("dark", vim.o.background)
    assert.same("lig-dark", vim.g.colors_name)
  end)

  it(" and remembers dark", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("lig-dark")
    vim.o.background = "light"
    vim.o.background = "dark"
    assert.same("dark", vim.o.background)
    assert.same("lig-dark", vim.g.colors_name)
  end)
end)
