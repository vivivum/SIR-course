pro SPINOR_penumbra

inpath = '/home/brc/'

restore,'SPINOR_penumb1565_corrected.sav'

; We select the spectral windows
; we read the central wavelength from LINES

w2=(spinor_wavelength(186:210)*10d0-15621.658d0)*1000.       ;line 10  --> transform nm to A and then to mA
in2=intarr(n_elements(w2))+10
si2=spinor_i(186:210) & sq2=spinor_q(186:210) & su2=spinor_u(186:210) & sv2=spinor_v(186:210)

w3=(spinor_wavelength(240:260)*10d0-15631.950d0)*1000        ;line 9
in3=intarr(n_elements(w3))+9
si3=spinor_i(240:260) & sq3=spinor_q(240:260) & su3=spinor_u(240:260) & sv3=spinor_v(240:260)

w4=(spinor_wavelength(300:358)*10d0-15645.020d0)*1000.       ;line 8 (+ 5,6 as blends)
in4=intarr(n_elements(w4))+8
si4=spinor_i(300:358) & sq4=spinor_q(300:358) & su4=spinor_u(300:358) & sv4=spinor_v(300:358)

w5=(spinor_wavelength(385:417)*10d0-15662.018d0)*1000.       ;line 12 + 13
in5=intarr(n_elements(w5))+12
si5=spinor_i(385:417) & sq5=spinor_q(385:417) & su5=spinor_u(385:417) & sv5=spinor_v(385:417)

in=[in2,in3,in4,in5] & w=[w2,w3,w4,w5]
si=[si2,si3,si4,si5] & sq=[sq2,sq3,sq4,sq5] & su=[su2,su3,su4,su5] & sv=[sv2,sv3,sv4,sv5]

; and write the profiles
write_profiles,'SPINOR_penumb1565.per',in,w,si,sq,su,sv

; to write the grid file we need the strating and ending wavelength and the step 
print,'line    10 : from',w2(0),' step =', (w2(n_elements(w2)-1)-w2(0))/float(n_elements(w2)-1) ,' to ',w2(n_elements(w2)-1)
print,'line     9 : from',w3(0),' step =', (w3(n_elements(w3)-1)-w3(0))/float(n_elements(w3)-1) ,' to ',w3(n_elements(w3)-1)
print,'line 8,5,6 : from',w4(0),' step =', (w4(n_elements(w4)-1)-w4(0))/float(n_elements(w4)-1) ,' to ',w4(n_elements(w4)-1)
print,'line 12,13 : from',w5(0),' step =', (w5(n_elements(w5)-1)-w5(0))/float(n_elements(w5)-1) ,' to ',w5(n_elements(w5)-1)

end
