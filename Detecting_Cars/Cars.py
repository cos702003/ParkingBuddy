
import cv2
cap = cv2.VideoCapture("video (3).avi")
#cap = cv2.VideoCapture("C:/Users/BHA/PycharmProjects/Detecting_Cars/video.avi")
car_cascade = cv2.CascadeClassifier("cars.xml")
while True:
        ret, frames = cap.read()
        gray = cv2.cvtColor(frames, cv2.COLOR_BGR2GRAY)
        cars = car_cascade.detectMultiScale(gray, 1.1, 1)
        for (x, y, w, h) in cars:
            cv2.rectangle(frames, (x, y), (x + w, y + h), (0, 0, 255), 2)
        cv2.imshow('video', frames)
cv2.destroyAllWindows()