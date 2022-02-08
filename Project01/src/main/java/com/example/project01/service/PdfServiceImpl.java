package com.example.project01.service;

import java.io.FileOutputStream;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project01.model.shop.CartDAO;
import com.example.project01.model.shop.CartDTO;
import com.example.project01.model.shop.DrugDTO;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class PdfServiceImpl implements PdfService {
	
	@Inject
	CartDAO cartDao;
	
	public PdfPCell createCell(String content, float borderWidth, int colspan, int alignment) {
	    PdfPCell cell = new PdfPCell(new Phrase(content));
	    cell.setBorderWidth(borderWidth);
	    cell.setColspan(colspan);
	    cell.setHorizontalAlignment(alignment);
	    return cell;
	}

	@Override
	public String createPdf(String userid, String name) {
		String result = "";
		try {
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream("c:/work/mylist.pdf"));
			document.open();
			BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
			Font font = new Font(baseFont, 9);
			float[] columnWidths = {1, 3, 1};
			PdfPTable table = new PdfPTable(columnWidths);
			table.setWidthPercentage(60);
			Chunk chunk = new Chunk("Drug Information", font);
			Paragraph ph = new Paragraph(chunk);
			ph.setAlignment(Element.ALIGN_CENTER);
			document.add(ph);
			document.add(Chunk.NEWLINE);
			table.addCell(createCell("From: " + name, 1, 3, Element.ALIGN_RIGHT));
			document.add(Chunk.NEWLINE);
			PdfPCell cell1 = new PdfPCell(new Phrase("NAME", font));
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			table.addCell(cell1);
			PdfPCell cell2 = new PdfPCell(new Phrase("DOSAGE", font));
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table.addCell(cell2);
			PdfPCell cell3 = new PdfPCell(new Phrase("AMOUNT", font));
			cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table.addCell(cell3);
			List<CartDTO> items = cartDao.list(userid);
			for (int i=0; i<items.size(); i++) {
				CartDTO dto = items.get(i);
				PdfPCell cellProductName = new PdfPCell(new Phrase(dto.getDrug_name(), font));
				table.addCell(cellProductName);
				PdfPCell cellProductDosage = new PdfPCell(new Phrase(dto.getDose(), font));
				table.addCell(cellProductDosage);
				PdfPCell cellAmount = new PdfPCell(new Phrase("" + dto.getAmount(), font));
				table.addCell(cellAmount);
			}
			float sumMoney = cartDao.sum_money(userid);
			table.addCell(createCell("Total  "+sumMoney, 2, 3, Element.ALIGN_RIGHT));
			document.add(table);
			document.close();
			result = "PDF file saved.";
		} catch (Exception e) {
			e.printStackTrace();
			result = "PDF file export failed.";
		}
		return result;
	}

}
