---
title: "CodeBook.m"
output: html_document
---

#Code Book
The Tidy data set contains 180 observations across 81 features listed below:

* subjectid: integer, ranges from 1 to 30, it represents the Subject ID participating in the Wearable Study
* activitname: character, represents the various activities performed by the subjects. The activityname values include:
  ** WALKING 
  ** WALKING UPSTAIRS 
  ** WALKING DOWNSTAIRS
  ** SITING
  ** STANDING
  ** LAYING
  
The following 79 numeric features represent the average of measurements grouped by activityname and subjectid.
  
Time domain fetrues (Numeric):
* AVGOf timedomain_bodyacc_meanx                 
* AVGOf timedomain_bodyacc_meany                
* AVGOf timedomain_bodyacc_meanz                 
* AVGOf timedomain_bodyacc_stdx                  
* AVGOf timedomain_bodyacc_stdy                  
* AVGOf timedomain_bodyacc_stdz                 
* AVGOf timedomain_gravityacc_meanx              
* AVGOf timedomain_gravityacc_meany             
* AVGOf timedomain_gravityacc_meanz             
* AVGOf timedomain_gravityacc_stdx              
* AVGOf timedomain_gravityacc_stdy               
* AVGOf timedomain_gravityacc_stdz               
* AVGOf timedomain_bodyaccjerk_meanx             
* AVGOf timedomain_bodyaccjerk_meany            
* AVGOf timedomain_bodyaccjerk_meanz            
* AVGOf timedomain_bodyaccjerk_stdx            
* AVGOf timedomain_bodyaccjerk_stdy              
* AVGOf timedomain_bodyaccjerk_stdz             
* AVGOf timedomain_bodygyro_meanx               
* AVGOf timedomain_bodygyro_meany                
* AVGOf timedomain_bodygyro_meanz                
* AVGOf timedomain_bodygyro_stdx                
* AVGOf timedomain_bodygyro_stdy                 
* AVGOf timedomain_bodygyro_stdz                 
* AVGOf timedomain_bodygyrojerk_meanx            
* AVGOf timedomain_bodygyrojerk_meany           
* AVGOf timedomain_bodygyrojerk_meanz           
* AVGOf timedomain_bodygyrojerk_stdx             
* AVGOf timedomain_bodygyrojerk_stdy             
* AVGOf timedomain_bodygyrojerk_stdz            
* AVGOf timedomain_bodyaccmag_mean             
* AVGOf timedomain_bodyaccmag_std                
* AVGOf timedomain_gravityaccmag_mean            
* AVGOf timedomain_gravityaccmag_std            
* AVGOf timedomain_bodyaccjerkmag_mean           
* AVGOf timedomain_bodyaccjerkmag_std            
* AVGOf timedomain_bodygyromag_mean             
* AVGOf timedomain_bodygyromag_std              
* AVGOf timedomain_bodygyrojerkmag_mean          
* AVGOf timedomain_bodygyrojerkmag_std           

 Frequency domain features (Numeric):
* AVGOf freqdomain_bodyacc_meanx            
* AVGOf freqdomain_bodyacc_meany                
* AVGOf freqdomain_bodyacc_meanz                 
* AVGOf freqdomain_bodyacc_stdx                  
* AVGOf freqdomain_bodyacc_stdy                  
* AVGOf freqdomain_bodyacc_stdz                 
* AVGOf freqdomain_bodyacc_meanfreqx             
* AVGOf freqdomain_bodyacc_meanfreqy             
* AVGOf freqdomain_bodyacc_meanfreqz             
* AVGOf freqdomain_bodyaccjerk_meanx            
* AVGOf freqdomain_bodyaccjerk_meany             
* AVGOf freqdomain_bodyaccjerk_meanz             
* AVGOf freqdomain_bodyaccjerk_stdx            
* AVGOf freqdomain_bodyaccjerk_stdy             
* AVGOf freqdomain_bodyaccjerk_stdz              
* AVGOf freqdomain_bodyaccjerk_meanfreqx         
* AVGOf freqdomain_bodyaccjerk_meanfreqy         
* AVGOf freqdomain_bodyaccjerk_meanfreqz        
* AVGOf freqdomain_bodygyro_meanx                
* AVGOf freqdomain_bodygyro_meany        
* AVGOf freqdomain_bodygyro_meanz                
* AVGOf freqdomain_bodygyro_stdx                
* AVGOf freqdomain_bodygyro_stdy                
* AVGOf freqdomain_bodygyro_stdz                
* AVGOf freqdomain_bodygyro_meanfreqx            
* AVGOf freqdomain_bodygyro_meanfreqy           
* AVGOf freqdomain_bodygyro_meanfreqz            
* AVGOf freqdomain_bodyaccmag_mean            
* AVGOf freqdomain_bodyaccmag_std              
* AVGOf freqdomain_bodyaccmag_meanfreq          
* AVGOf freqdomain_body_bodyaccjerkmag_mean      
* AVGOf freqdomain_body_bodyaccjerkmag_std      
* AVGOf freqdomain_body_bodyaccjerkmag_meanfreq  
* AVGOf freqdomain_body_bodygyromag_mean  
* AVGOf freqdomain_body_bodygyromag_std          
* AVGOf freqdomain_body_bodygyromag_meanfreq     
* AVGOf freqdomain_body_bodygyrojerkmag_mean     
* AVGOf freqdomain_body_bodygyrojerkmag_std     
* AVGOf freqdomain_body_bodygyrojerkmag_meanfreq
  
 
  
  
  