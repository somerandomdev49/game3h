local bump = require "lib/bump"

local playerImage = love.graphics.newImage("gfx/player.png")
local p = { s = 140, x = 0, y = 0 }
local world = bump.newWorld()
local asd = {}
function love.load()
    p.x, p.y = 400-16, 300-24
    world:add(p, p.x, p.y, 32, 48)

    world:add({"A"}, -5, -5, 10, love.graphics.getHeight() + 10)
    world:add({"B"},
        love.graphics.getWidth() - 5, -5,
        10, love.graphics.getHeight() + 10
    )
    world:add({"C"}, -5, -5, love.graphics.getWidth() + 10, 10)
    world:add({"D"},
        -5, love.graphics.getHeight() - 5,
        love.graphics.getWidth() + 10, 10
    )
end

function love.draw()
    love.graphics.rectangle("fill", 100, 100, 50, 50)
    love.graphics.draw(playerImage, p.x, p.y, 0, 0.5, 0.5)
end

function love.update(dt)
    local px, py = p.x, p.y
    if love.keyboard.isDown("a") then px = px - p.s * dt
    elseif love.keyboard.isDown("d") then px = px + p.s * dt end
    if love.keyboard.isDown("s") then py = py + p.s * dt
    elseif love.keyboard.isDown("w") then py = py - p.s * dt end
    p.x, p.y, _, _ = world:move(p, px, py)
end

function lightningBolt(t, x, y)
    local MAX_TIME = 1
    local MAX_HEIGHT = love.graphics.getHeight()
    local MAX_WIDTH = 100

    local width = math.sin(math.pi * t / MAX_TIME) * MAX_WIDTH

    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", love.graphics.getWidth() - x - width, 0, width, MAX_HEIGHT)
    love.graphics.rectangle("fill", x, 0, width, MAX_HEIGHT)

    return t > MAX_TIME
end
