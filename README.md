# Cryptographic Key Generation from Biometric Data

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

