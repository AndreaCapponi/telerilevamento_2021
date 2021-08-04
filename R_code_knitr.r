#Al di sotto di questo commento studiare e organizzare la lezione del 14/04/2021

#install.packages() is a function which download and install packages from CRAN-like repositories or from local files

#The first package to install is RStoolbox, a toolbox for remote sensing image processing and analysis such as calculating spectral indices, principal component transformation, unsupervised and supervised classification or fractional cover analyses:

install.packages("RStoolbox")

#The second package to install is knitr, a general-purpose tool for dynamic report generation in R using Literate Programming techniques:

install.packages('knitr', dependencies = TRUE)

#library() is a function which load and attach add-on packages, in this case the previous RStoolbox and knitr packages:

library(RStoolbox)

library(knitr)

#I might as well consider require() function, giving a warning message and returning a logical value as FALSE if the requested package is not found and TRUE if the package is loaded. The library() function instead by default returns an error if the requested package does not exist!

#In my computer R must use the folder named simply lab and I exploit a function (setwd) for the association between R and lab folder:

setwd("C:/lab/")

# stitch() is a convenience function that creates automatically a small-scale report based on a R script and a template:

stitch("R_code_Greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

#The future script will be R_code_Greenland.r.txt and the default template is an Rnw file (LaTeX); stitch_rhtml() and stitch_rmd() are wrappers on top of stitch() using the R HTML and R Markdown templates respectively!

#knitr is conceptually internal to R but in creating a report it is based on an external code (inverted commas). After importing it into R, this function saves the complete code as a text document inside the folder - indicated instead with the previous setwd () function - with a title corresponding to the name of the selected repository (R_code_Greenland)

#Discordanza tra sintassi GitHub e R da risolvere andando a specificare il formato del documento di testo nel quale si ha il codice da applicare per creare il report!
#R_code_Greenland.r.tex, perchè non è il file PDF finale?
#Errore: LaTeX failed to compile R_code_Greenland.r.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips.
Inoltre: Warning message:
In system2(..., stdout = if (use_file_stdout()) f1 else FALSE, stderr = f2) :
  '"pdflatex"' not found
#Il sistema Windows non ha LaTeX come compilatore per il file R_code_Greenland.r.tex per cui bisognerà appoggiarsi a un softwar grauito e online!
#tinytex::install_tinytex()
#tinytex::tlmgr_update()
#Soluzione strutturale ma...
#OVERLEAF!
#Iscrizione a questo sito tramite email personale per andare a creare, gestire e modificare files LaTeX
#Nuovo progetto
           #Il mio pdf tex
           #Ricompila per generazione PDF
           #Errrore perchè noi abbiamo cancellato lo schema di base come codice tex per generarne uno!
           #Importo il file tex 
          #Greenland su Overleaf facendo copia e incolla
           #Cosa accade?
           #Nessuna figura, come inserirle?
           #/includegraphics (la sintassi non è completa attenzione!)
          #generare una nuova cartella per le figure e importarle nel report che si è creato: figure
           #Se non è stata generata per le precedenti problematiche?
           #Il professore le carica momentaneamente su Virtuale
           #Upload o carica come comando all'interno di Overleaf
           #Contattare Elisa Thouverai per aggiustare il mio Windows!
           
