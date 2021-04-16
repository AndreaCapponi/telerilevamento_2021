#Al di sotto di questo commento studiare e organizzare la lezione del 14/04/2021
#install.packages("RStoolbox")
#library(RStoolbox)
#install.packages('knitr', dependencies = TRUE)
#library(knitr)
#stitch function is required!
#stitch: Automatically create a report based on an R script and a template
#This is a convenience function for small-scale automatic reporting based on an R script and a template. The default template is an Rnw file (LaTeX); stitch_rhtml() and stitch_rmd() are wrappers on top of stitch() using the R HTML and R Markdown templates respectively.
#setwd("C:/lab/")
#Knitr è interno a R sfrutta un codice esterno per creare un report (inverted commas) importandolo nel programma* per successivamente salvarlo come PDF nella cartella dove era collocato il codice precedente!
#library(knitr)
#Il codice viene salvato in un documento di testo all'interno della cartella lab riportando il nome del repository del quale noi vogliamo creare il report perchè *
#Com'è la sintassi della funzione stitch?
#stitch("R_code_Greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
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
           
