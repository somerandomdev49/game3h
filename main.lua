local bump = require "lib/bump"

local playerImage = love.graphics.newImage("gfx/player.png")
local px, py = 0, 0
local ps = 140
local bumpWorld = bump.newWorld(64)

local t = 0
local done = false
function love.draw()
    love.graphics.draw(playerImage, px, py)

    if not done then
        done = lightningBolt(t, 400, 300)
    end
end

function love.update(dt)
    if not done then
        print "not done"
        t = t + dt
    end
    if love.keyboard.isDown("a") then px = px - ps * dt
    elseif love.keyboard.isDown("d") then px = px + ps * dt end
    if love.keyboard.isDown("s") then py = py + ps * dt
    elseif love.keyboard.isDown("w") then py = py - ps * dt end
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
