_RELEASE_MODE = true
_DEMO = false

function love.conf(t)
    t.identity = "balatro"
    t.version = "11.4"
    t.console = false
    t.accelerometerjoystick = false
    t.externalstorage = true
    t.gammacorrect = true

    t.window.title = "Balatro"
    t.window.width = 1440
    t.window.height = 3200
    t.window.minwidth = 720
    t.window.minheight = 1280
    t.window.resizable = true
    t.window.fullscreen = false
    t.window.vsync = 1
    t.window.msaa = 0
    t.window.depth = 24
    t.window.stencil = 8
    t.window.display = 1
    t.window.highdpi = true
    t.window.usedpiscale = true

    t.modules.audio = true
    t.modules.data = true
    t.modules.event = true
    t.modules.font = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.joystick = false
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.physics = false
    t.modules.sound = true
    t.modules.system = true
    t.modules.thread = true
    t.modules.timer = true
    t.modules.touch = true
    t.modules.video = false
    t.modules.window = true
end