# A-Pipeline-for-Enhanced-Multimodal-Imaging-of-Structural-Concrete
Code and data for the paper "A-Pipeline-for-Enhanced-Multimodal-Imaging-of-Structural-Concrete"

[Link to the article](https://link.springer.com/article/10.1617/s11527-021-01803-w)

[Read the full text](https://link.springer.com/epdf/10.1617/s11527-021-01803-w?sharing_token=XyznorzgkeENGz7OEZpGU3k_ZoEKMXbDGXWx5s5gP1ZPvMzLF_UABix_qIxFxYsINt3Yu5WUiiEJleatrm6USmkCQopu_VNeBXSDCIx1_AvvsCmM0EnL5zDyd6glOSqJSWHYgiZvmaNvhHnwCKdvBn7QmYa1In8AxorlEnsg25E%3D)
```diff
- **Please check this repo regularly for the newest updates. We will be sharing more soon.**
```
## Overview
The source codes and data for the paper A-Pipeline-for-Enhanced-Multimodal-Imaging-of-Structural-Concrete .

### XTFM
XTFM, is an integrated approach based on the total focusing method (TFM) and the synthetic aperture focusing technique (SAFT) that can be used to reconstruct 2D images from ground penetrating radar and ultrasonic echo array (UEA).

It considers overlapping measurements and works across modalities, i.e., it can process both GPR and UEA data. Overlapping measurements return an independent array response at different positions where there is a dependent interelement response at each position. Therefore, a large matrix of measurements is collected that contains both interelement as well as independent array data. We treat each UEA measurement the same as one GPR recording where the data are stored in the form of an nS x sL x nC × nC array where where nS is the number of independent scans, sL is the signal length of a raw measurement and nC is the number of channels of the instrument.

For every measurement, the image area that can be covered by the signal length is used for reconstruction. Thus, the beam is not focused in any particular manner. We deliberately omit the enveloping of the signal (using the Hilbert Transform) that is often applied in practice since we find that it creates the illusion of a circular shape for circular objects like rebars. It should be noted that the GPR instrument used in this study is not an array GPR (it has only one emitter and receiver), however, our proposed XTFM algorithm works for any number of channels ≥ 2.

For more info, see the [paper]((https://link.springer.com/epdf/10.1617/s11527-021-01803-w?sharing_token=XyznorzgkeENGz7OEZpGU3k_ZoEKMXbDGXWx5s5gP1ZPvMzLF_UABix_qIxFxYsINt3Yu5WUiiEJleatrm6USmkCQopu_VNeBXSDCIx1_AvvsCmM0EnL5zDyd6glOSqJSWHYgiZvmaNvhHnwCKdvBn7QmYa1In8AxorlEnsg25E%3D)) and the [code](https://github.com/Sinamhd9/A-Pipeline-for-Enhanced-Multimodal-Imaging-of-Structural-Concrete/blob/main/XTFM/XTFM.py), or try the tutorial notebook. 

### Fusion



## Usage 
We hope you find these codes useful and you could reuse or improve it in your work.

This repository is meant to be a starting point for researchers and engineers to experiment with our proposed pipeline and develop newer/better models.  

## Citation 

Mehdinia, S., Schumacher, T., Song, X. et al. A pipeline for enhanced multimodal 2D imaging of concrete structures. Mater Struct 54, 228 (2021). https://doi.org/10.1617/s11527-021-01803-w
