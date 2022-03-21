# Experiment for RQ1: Performance of Model

To answer RQ1, we first evaluated the ability of our model [MobileNetV2](../../approach/GUI_classification/) to accurately and efficiently differentiate between fully rendered GUIs and partially rendered GUIs.

## Testing dataset
We split the screens in the dataset by app, completing with the 7,507-1,877 (80%-20%) app split for the training and testing sets, respectively.
The resulting split has 20,125 GUIs in the testing dataset.

## Machine learning based baselines
1. We adopted three types of feature extraction methods used in machine learning, e.g., Scale invariant feature transform (SIFT)[^1], Speed up robot features (SURF)[^2], and Oriented fast and rotated brief (ORB)[^3].
With these features, we applied three commonly-used machine learning classifiers, e.g., Support Vector Machine (SVM)[^4], K-Nearest Neighbor (KNN)[^5], and Random Forests (RF)[^6], for classifying the GUI rendering state.

2. Train and evaluate the baselines
```
OUTPUT_DIR="model"
DATA_PATH="binaryUI_app"
IMG_FEATURE="sift"
CLASSIFER="svm"

python train.py --output_dir ${OUTPUT_DIR} \
                 --do_train \
                 --img_feature ${IMG_FEATURE} \
                 --classifer ${CLASSIFER} \
                 --data_path ${DATA_PATH} \
```

## Deep learning based baselines
We also experimented with off-the-shelf feature extraction methods used in deep learning, e.g., traditional CNN with 3 convolutional layers, and ResNet-18[^7]. We used two fully connected layers as a deep learning classifier.

2. Train and evaluate the baselines
    - Follow the instructions in [GUI_classification](../../approach/GUI_classification/)
    - Use `--model_name resnet18` to evaluate ResNet-18
    - Use `--model_name custom` to evaluate traditional CNN


## Results
<p align="center">
<img src="../../figures/model_performance.png" width="50%"/> 
</p>
Our model achieves 99.8% accuracy which is much higher than that of baselines, e.g., 31.8% boost compared with the best machine learning baseline (SIFT-SVM). In addition, our model takes on average 43.02ms per GUI inference, representing the ability of our model to accurately and efficiently discriminate the GUI rendering state.




[^1]: Lowe, D. G. (2004). Distinctive image features from scale-invariant keypoints. International journal of computer vision, 60(2), 91-110.
[^2]: Bay, H., Tuytelaars, T., & Gool, L. V. (2006, May). Surf: Speeded up robust features. In European conference on computer vision (pp. 404-417). Springer, Berlin, Heidelberg.
[^3]: Rublee, E., Rabaud, V., Konolige, K., & Bradski, G. (2011, November). ORB: An efficient alternative to SIFT or SURF. In 2011 International conference on computer vision (pp. 2564-2571). Ieee.
[^4]: Kotsiantis, S. B., Zaharakis, I., & Pintelas, P. (2007). Supervised machine learning: A review of classification techniques. Emerging artificial intelligence applications in computer engineering, 160(1), 3-24.
[^5]: Keller, J. M., Gray, M. R., & Givens, J. A. (1985). A fuzzy k-nearest neighbor algorithm. IEEE transactions on systems, man, and cybernetics, (4), 580-585.
[^6]: Breiman, L. (2001). Random forests. Machine learning, 45(1), 5-32.
[^7]: He, K., Zhang, X., Ren, S., & Sun, J. (2016). Deep residual learning for image recognition. In Proceedings of the IEEE conference on computer vision and pattern recognition (pp. 770-778).