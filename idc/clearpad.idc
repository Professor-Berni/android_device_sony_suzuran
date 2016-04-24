# Device Type
touch.deviceType = touchScreen

# Pressure
touch.pressure.scale = 0.0065

# Touch Filter
touch.filter.level = 3
touch.filter.path = /system/lib64/touchfilter/tfsw.so

# Switcher
touch.filter.tfsw.Debug = 0
touch.filter.tfsw.array = 1
touch.filter.tfsw.f0.level = 3
touch.filter.tfsw.f0.path = /system/lib64/touchfilter/roadrunner_ukf.so

# Roadrunner
touch.filter.RoadRunner.Enabled = 1
touch.filter.RoadRunner.Debug = 0
touch.filter.RoadRunner.c0.PredictionSteps = 2.1
touch.filter.RoadRunner.c1.PredictionSteps = 3.2
touch.filter.RoadRunner.c2.PredictionSteps = 4.9
touch.filter.RoadRunner.c3.PredictionSteps = 6.4
touch.filter.RoadRunner.FrameRate = 0.0079
touch.filter.RoadRunner.PreSmoothingFactor = 0.2
touch.filter.RoadRunner.PostSmoothingFactor = 0.1
touch.filter.RoadRunner.DisplayPpi = 428
touch.filter.RoadRunner.VelocityThreshold = 50
touch.filter.RoadRunner.OvershootControl = 1

# Glove Mode
touch.gloveMode.deflatePressure = 1
pointercontroller.touch1.filename = /system/somc/touch/images/big_touch.png
pointercontroller.touch1.hotSpotX = 310
pointercontroller.touch1.hotSpotY = 310
pointercontroller.touchsplash1.filename = /system/somc/touch/images/splash.png
pointercontroller.touchsplash1.hotSpotX = 40
pointercontroller.touchsplash1.hotSpotY = 40
