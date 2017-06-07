; Plots histogram of some values.
; Uses the programs in the Coyote IDL Library.
; http://dfanning.com/documents/programs.html

output='out.eps'

ps=0    ; **CHANGE**

; Set output file
if (ps eq 1) then begin
   set_plot, 'ps'
   device,/encapsulated,filename=output
endif else begin
   set_plot, 'X'
endelse

; Reads data from Monte Carlo simulations
; Contains the D and prob results from the 2D K-S test
in='mcks2d.dat'        ; **CHANGE**
readcol, in, d, prob, format='F,F', skipline=1

; Vector to be processed
v=d
;v=ncorrs

; Histoplot is called in this way to fit a gaussian afterwards.
; Clears h, loc and binsize before running histoplot.
; Be careful about the binsize , which cannot be < 1 in some cases!
;binsize=1
Histoplot, v, /FILL, HISTDATA=h, LOCATIONS=loc, BINSIZE=binsize

; Fits gaussian
binCenters = loc + (binsize / 2.0)
yfit = GaussFit(binCenters, h, coeff, NTERMS=3)
oplot, binCenters, yfit, COLOR=FSC_Color('dodger blue'), THICK=2

; Outputs parameters of gaussian fit
maxfit = String(coeff[0], FORMAT='(F0.2)')
centerfit = String(coeff[1], FORMAT='(F0.2)')
fwhm = String(2 * SQRT(2 * ALOG(2)) * coeff[2], FORMAT='(F0.2)')
sigma = String(coeff[2], FORMAT='(F0.2)')
XYOutS, 0.5, 0.85, /NORMAL, 'Maximum: ' + maxfit, COLOR=FSC_Color('navy')
XYOutS, 0.5, 0.80, /NORMAL, 'Center: ' + centerfit, COLOR=FSC_Color('navy')
XYOutS, 0.5, 0.75, /NORMAL, 'FWHM: ' + fwhm, COLOR=FSC_Color('navy')
XYOutS, 0.5, 0.7, /NORMAL, 'sigma: ' + sigma, COLOR=FSC_Color('navy')

; To compute the probability that D from the Monte Carlo experiment
; exceeds the one from the real data, compare the distribution of 
; Ds. Follows the advice of NR F77, page 641
read, dobs, PROMPT="Observed value of D (real data): "
exceed=where(d ge dobs)
probran=(1.0*n_elements(d[exceed]))/n_elements(d)
print, 'Probability of being chance =', probran





; Erase these variables to avoid conflict with next run of this code.
; Undefine is part of the coyote library.
undefine, h
undefine, loc
undefine, binsize

if (ps eq 1) then device,/close
set_plot, 'X'

END 
