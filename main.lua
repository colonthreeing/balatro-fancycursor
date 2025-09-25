
FancyCursor = {
    normal = love.mouse.getSystemCursor("arrow"),
    pointer = love.mouse.getSystemCursor("hand"),
    -- crosshair = love.mouse.getSystemCursor("crosshair"),
    move = love.mouse.getSystemCursor("sizeall"),
}

function FancyCursor.update_cursor()
    if G.CONTROLLER then
        if G.CONTROLLER.dragging.target ~= nil then
            love.mouse.setCursor(FancyCursor.move)
        elseif G.CONTROLLER.hovering.target then
            local h = G.CONTROLLER.hovering

            -- print(h.target)

            if h.target.config.button ~= nil then
                love.mouse.setCursor(FancyCursor.pointer)
            elseif h.target.states.drag.can == true then
                love.mouse.setCursor(FancyCursor.pointer)
            else
                love.mouse.setCursor(FancyCursor.normal)
            end

            -- love.mouse.setCursor(FancyCursor.pointer)
        end
    end
end

local old_update = Game.update

function Game:update(dt)
    old_update(self, dt)
    FancyCursor.update_cursor()
end
