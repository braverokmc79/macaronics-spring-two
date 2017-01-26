package com.macaronics.www.util.pdf;

import org.springframework.stereotype.Component;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.CMYKColor;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;



@Component
public class PdfPageEvent extends PdfPageEventHelper {
 
    // Watermark 폰트 설정
//  Font FONT = new Font(FontFamily.HELVETICA, 52, Font.BOLD, new GrayColor(0.75f));
    Font FONT = new Font(FontFamily.HELVETICA, 52, Font.BOLD, new CMYKColor(64, 11, 0, 0));
     
    Phrase[] header = new Phrase[2];
    int pagenumber;
     
    @Override
    public void onOpenDocument(PdfWriter writer, Document document) {
        header[0] = new Phrase("2015. 01. 07"); // 헤더 머릿말에 넣을 텍스트
    }
     
    @Override
    public void onChapter(PdfWriter writer, Document document,
            float paragraphPosition, Paragraph title) {
        header[1] = new Phrase(title.getContent());
                pagenumber = 1;
    }
 
    @Override
    public void onStartPage(PdfWriter writer, Document document) {
        pagenumber++;
    }
     
    @Override
    public void onEndPage(PdfWriter writer, Document document) {
        Rectangle rect = writer.getBoxSize("boxName"); // boxName을 PdfWriter.setBoxSize의 boxname 매개 변수와 같게 해야 함.
         
        switch (writer.getPageNumber() % 2) { // 쪽수 쪽, 홀수 쪽 구분해서 속성 적용.
        case 0: // 짝수 쪽
            ColumnText.showTextAligned(writer.getDirectContent(),
                    Element.ALIGN_RIGHT, header[0], rect.getRight(),
                    rect.getTop(), 0);
            break;
        case 1: // 홀수 쪽
            ColumnText.showTextAligned(writer.getDirectContent(),
                    Element.ALIGN_LEFT, header[1], rect.getLeft(),
                    rect.getTop(), 0);
            break;
        }
         
        // Watermark
        ColumnText.showTextAligned(writer.getDirectContentUnder(),
                Element.ALIGN_CENTER, new Phrase("Macaronics DOCUMENT", FONT), // 워터마크로 넣을 텍스트
                297.5f, 421, writer.getPageNumber() % 2 == 1 ? 45 : -45);
         
        // 쪽 번호 매기기
        ColumnText.showTextAligned(writer.getDirectContent(),
                Element.ALIGN_CENTER,
                new Phrase(String.format("%d", pagenumber)), // %d의 앞 뒤에 "-" 추가하면 "-1-" 이런 식..
                (rect.getLeft() + rect.getRight()) / 2, rect.getBottom() - 18, 0);
         
    }
     
}