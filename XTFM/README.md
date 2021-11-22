
# XTFM

## Overview

XTFM, is an integrated approach based on the total focusing method (TFM) and the
synthetic aperture focusing technique (SAFT) that can be used to reconstruct
2D images from ground penetrating radar and ultrasonic echo array (UEA).

It considers overlapping measurements and works across modalities, i.e., it can process both GPR and UEA
data. Overlapping measurements return an independent array response at different positions where
there is a dependent interelement response at each position. Therefore, a large matrix of
measurements is collected that contains both interelement as well as independent array data. We
treat each UEA measurement the same as one GPR recording where the data are stored in
the form of an nS x sL x nC × nC array where where nS is the number of independent scans,
sL is the signal length of a raw measurement and nC is the number of channels of the instrument. 

For every measurement, the image area that can be covered by the signal length is used for reconstruction. Thus, the beam
is not focused in any particular manner. We deliberately omit the enveloping of the signal (using
the Hilbert Transform) that is often applied in practice since we find that it creates the illusion of
a circular shape for circular objects like rebars. It should be noted that the GPR instrument used in
this study is not an array GPR (it has only one emitter and receiver), however, our proposed XTFM
algorithm works for any number of channels ≥ 2.

## Sample Results

### GPR



### UEA
