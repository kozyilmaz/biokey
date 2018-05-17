# Cryptographic Key Generation from Biometric Data

**biokey.zip does not contain the FVC2002 samples, please refer to the GitHub repository below where it contains everything**  
```
https://github.com/kozyilmaz/biokey
```

This repository tries to utilize Fuzzy Extractors for Fingerprint Matching and Biometric Key extraction 

### Implementation of Secure Sketch Reproduction
Dodis, Yevgeniy, Leonid Reyzin, and Adam Smith 
"Fuzzy extractors: How to generate strong keys from biometrics and other noisy data." 
In International conference on the theory and applications of cryptographic techniques, pp. 523-540. Springer, Berlin, Heidelberg, 2004.
[(article link)](http://www.cs.bu.edu/~reyzin/papers/fuzzy.pdf) 

Kang, Hyunho, Yohei Hori, Toshihiro Katashita, and Manabu Hagiwara 
"The Implementation of Fuzzy Extractor is Not Hard to Do: An Approach Using PUF Data." 
In Proceedings of the 30th Symposium on Cryptography and Information Security, Kyoto, Japan, pp. 22-25. 2013. 
[(article link)](https://pdfs.semanticscholar.org/1ef4/e8677073a0fd2882c92e8ff3edf91582ffc2.pdf) 

Thai, Raymond 
"Fingerprint Image Enhancement and Minutiae Extraction." 
[(article link)](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.121.9756&rep=rep1&type=pdf) 

Arakala, Arathi, Jason Jeffers, and Kathy J. Horadam 
"Fuzzy extractors for minutiae-based fingerprint authentication." 
In International Conference on Biometrics, pp. 760-769. Springer, Berlin, Heidelberg, 2007. 
[(article link)](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.184.261&rep=rep1&type=pdf) 


### Used Projects
- Simple Fingerprint Matching from Vahid K. Alilou [(link)](https://www.mathworks.com/matlabcentral/fileexchange/44369-fingerprint-matching--a-simple-approach)
- PinSketch and Juels-Sudan Secure Sketch [(link)](http://www.cs.bu.edu/~reyzin/code/fuzzy.html)


### Creating the Fingerprint Minutiae Database (fingerprintmatching)
```shell
>> build_db(9,8)
extracting features from 101_1.tif ...
 >>> enhancement done.
 >>> making mask done.
 >>> finding minutiae done.
 >>> filtering false minutiae done.
...
extracting features from 109_8.tif ...
 >>> enhancement done.
 >>> making mask done.
 >>> finding minutiae done.
 >>> filtering false minutiae done.
```


### Preliminary Secure Sketch implementation (biokey)
```
>> secure_sketch_test
Secure Sketch Test Success
```


### Creating the Secure Sketch (P) and Hash (R) Database from Minutiae Database (biokey)
```
>> minutiae_to_secure_sketch
```


### Calculate and compare hash values (R) with Secure Sketch Database (biokey) (which fails miserably)
```
>> fingerprint_test
Extracting features from 101_1.tif ...
 >>> enhancement done.
 >>> making mask done.
 >>> finding minutiae done.
 >>> filtering false minutiae done.
101_1.tif (6/6)
101_2.tif (0/5)
101_3.tif (0/7)
101_4.tif (0/3)
101_5.tif (0/1)
101_6.tif (0/9)
101_7.tif (0/9)
101_8.tif (0/7)
102_1.tif (0/18)
102_2.tif (0/13)
102_3.tif (0/11)
102_4.tif (0/11)
102_5.tif (0/6)
102_6.tif (0/20)
102_7.tif (0/8)
102_8.tif (0/10)
103_1.tif (0/18)
103_2.tif (0/9)
103_3.tif (0/11)
103_4.tif (0/5)
103_5.tif (0/15)
103_6.tif (0/16)
103_7.tif (0/13)
103_8.tif (0/5)
104_1.tif (0/22)
104_2.tif (0/22)
104_3.tif (0/20)
104_4.tif (0/23)
104_5.tif (0/15)
104_6.tif (0/30)
104_7.tif (0/33)
104_8.tif (0/17)
105_1.tif (0/19)
105_2.tif (0/17)
105_3.tif (0/12)
105_4.tif (0/17)
105_5.tif (0/11)
105_6.tif (0/7)
105_7.tif (0/16)
105_8.tif (0/13)
106_1.tif (0/28)
106_2.tif (0/33)
106_3.tif (0/29)
106_4.tif (0/18)
106_5.tif (0/21)
106_6.tif (0/19)
106_7.tif (0/20)
106_8.tif (0/12)
107_1.tif (0/15)
107_2.tif (0/18)
107_3.tif (0/20)
107_4.tif (0/21)
107_5.tif (0/15)
107_6.tif (0/23)
107_7.tif (0/24)
107_8.tif (0/20)
108_1.tif (0/20)
108_2.tif (0/20)
108_3.tif (0/21)
108_4.tif (0/19)
108_5.tif (0/24)
108_6.tif (0/31)
108_7.tif (0/29)
108_8.tif (0/23)
109_1.tif (0/18)
109_2.tif (0/16)
109_3.tif (0/17)
109_4.tif (0/11)
109_5.tif (0/15)
109_6.tif (0/15)
109_7.tif (0/16)
109_8.tif (0/13)
```