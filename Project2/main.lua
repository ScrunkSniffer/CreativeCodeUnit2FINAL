require("L5")

faceTimer = millis()
gridVal = {}
--CMY color values--
backgroundColors = {
    {0, 255, 255},
    {255, 0, 255},
    {255, 255, 0},
}
--facial features--
Leb = {}
Reb = {}
noses = {}
Leyes = {}
Reyes = {}
mouths = {}

function setup()
    size(1100, 800)
    windowTitle("random face")
    
    genFace()
    Leb = {
        loadImage("assets/Leb1.png"),
        loadImage("assets/Leb2.png"),
        loadImage("assets/Leb3.png"),
        loadImage("assets/Leb4.png"),
        loadImage("assets/Leb5.png")
    }

    Reb = {
        loadImage("assets/Reb1.png"),
        loadImage("assets/Reb2.png"),
        loadImage("assets/Reb3.png"),
        loadImage("assets/Reb4.png"),
        loadImage("assets/Reb5.png")
    }

    noses = {
        loadImage("assets/nose1.png"),
        loadImage("assets/nose2.png"),
        loadImage("assets/nose3.png"),
        loadImage("assets/nose4.png"),
        loadImage("assets/nose5.png")
    }

    Leyes = {
        loadImage("assets/eye1.png"),
        loadImage("assets/Leye2.png"),
        loadImage("assets/Leye3.png"),
        loadImage("assets/Leye4.png"),
        loadImage("assets/Leye5.png")
    }

    Reyes = {
        loadImage("assets/Reye1.png"),
        loadImage("assets/Reye2.png"),
        loadImage("assets/Reye3.png"),
        loadImage("assets/Reye4.png"),
        loadImage("assets/Reye5.png")
    }

    mouths = {
        loadImage("assets/mouth1.png"),
        loadImage("assets/mouth2.png"),
        loadImage("assets/mouth3.png"),
        loadImage("assets/mouth4.png"),
        loadImage("assets/mouth5.png")
    }

end

function genFace()

    --eyeBrows--
    leftEyebrow = math.random(1, 5)
    rightEyebrow = math.random(1, 5)

    --eyes--
    leftEye = math.random(1, 5)
    rightEye = math.random(1, 5)

    --noseSpecs--
    nose = math.random(1, 5)
    noseX = math.random(400, 420)
    noseY = math.random(280, 350)
    noseSize = math.random(220, 300)

    mouth = math.random(1, 5)

    gridVal = {}
    for x = 1, 11 do
        gridVal[x] = {}
        for y = 1, 8 do
            gridVal[x][y] = math.random(1, 3)
        end
    end
end

function draw()
    --timer--
    if millis() - faceTimer >= 5000 then
        genFace()
        faceTimer = millis()
    end

    --grid--
    for x = 1, 11 do
        for y = 1, 8 do
            colorChoice = gridVal[x][y]

            fill(
                backgroundColors[colorChoice][1],
                backgroundColors[colorChoice][2],
                backgroundColors[colorChoice][3]
            )

            rect((x-1)*100, (y-1)*100, 100, 100)
        end
    end

    --Facial Features--
    image(Leb[leftEyebrow], 5, 5)
    image(Reb[rightEyebrow], 600, 5)
    image(Leyes[leftEye], 5, 200)
    image(Reyes[rightEye], 600, 200)
    image(noses[nose], noseX, noseY, noseSize, noseSize)
    image(mouths[mouth], 300, 500)
end

function keyPressed()
  if key == 's' then
    save()
  end
 end