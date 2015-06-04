<cfscript>
  variables.config = new dgen.Configuration();
  
  fileFactoryManager = config.getFactoryManager("FileFactoryManager");
  factoryPDF = fileFactoryManager.getFileFactory("PDFFactory");
  
  fileBuilderFactoryManager = config.getFactoryManager("FileBuilderFactoryManager");
  factoryPDFBuilder = fileBuilderFactoryManager.getFileBuilderFactory("ITextFactory");
  builderPDF = factoryPDFBuilder.createBuilder();
  
  filePDF = factoryPDF.createFile(builderPDF);
  page1 = filePDF.addPage();
  
  // Page1
  saveContent variable = "htmlText" { writeOutput(
    "<h1>Hello</h1>"
  & "<br><br>Hello 1"
  & "<br><br>Hello 2"
  );}
  page1.setContents(htmlText);
  page1.setHeader("<div align=""center"">This is header</div>");
  page1.setFooter("This is footer");
  
  filePDF.generate("C:\TestOutput\testPDF.pdf");
  writeOutput("PDF generated successfully!");
</cfscript>
