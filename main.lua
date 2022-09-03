local bump = require "lib/bump"

local playerImage = love.graphics.newImage("gfx/player.png")
local px, py = 0, 0
local ps = 140
local bumpWorld = bump.newWorld(64)


function love.draw()
    love.graphics.draw(playerImage, px, py)
end

function love.update(dt)
    if love.keyboard.isDown("a") then px = px - ps * dt
    elseif love.keyboard.isDown("d") then px = px + ps * dt end
    if love.keyboard.isDown("s") then py = py + ps * dt
    elseif love.keyboard.isDown("w") then py = py - ps * dt end
end
