# Object Detection

# Aim
To build a deep learning model to detect objects and deploy this model on a flutter app.

## Feature
It can detect objects when catured from camera or uploaded from the gallery.

# Main Concept
### Convolutional Neural Network
A **Convolutional Neural Network (ConvNet/CNN)** is a Deep Learning algorithm which can take in an input image, assign importance (learnable weights and biases) to various aspects/objects in the image and be able to differentiate one from the other. The pre-processing required in a ConvNet is much lower as compared to other classification algorithms. While in primitive methods filters are hand-engineered, with enough training, ConvNets have the ability to learn these filters/characteristics.

# Dataset
For this project, *Cifar-10* was used.

#### About the dataset
The CIFAR-10 dataset consists of 60000 32x32 colour images in 10 classes, with 6000 images per class. There are 50000 training images and 10000 test images.  
The dataset is divided into five training batches and one test batch, each with 10000 images. The test batch contains exactly 1000 randomly-selected images from each class. The training batches contain the remaining images in random order, but some training batches may contain more images from one class than another. Between them, the training batches contain exactly 5000 images from each class.<br>
<img   src='https://res.cloudinary.com/dl0dsqomf/image/upload/v1614950088/cifar_qlgnyq.jpg'/>

## Technologies Used
1. For front-end, Flutter  is used to create a cross-platform app. Flutter's main language is Dart.
2. Firebase Firestore and Firebase Storage is used to store the user upload image and the url is stored into the NoSQL database, i.e. firestore.
3. Python is used for creation of the model.


# Credits

Aayush Kumaria - Worked as a machine learning engineer and built the model with accuracy of 80% (Me)
Nishanth Bhat -  Worked on the flutter app and connected it to the firebase and python back-ends. (https://github.com/nishanthbhat07)

