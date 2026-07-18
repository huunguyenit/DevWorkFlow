<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "WKInvoiceMultiForm">
  <!ENTITY ParentController "WKTran">
  <!ENTITY GridController "WKInvoiceMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c81$000000">
  <!ENTITY FlowMultiDetailTable "d81$000000">

  <!ENTITY OtherCopyField "he_so,gia_nt,gia,ma_nt,tk_vt,tk_gv,tk_cpbh,tk_tl,nhieu_dvt,ma_lo,lo_yn,ma_vi_tri,vi_tri_yn,stt_rec_dh,stt_rec0dh &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn bán hàng" e="Select Sales Invoice"></title>
  <fields>
    &FlowMultiFormField;
  </fields>

  <views>
    &FlowMultiFormView;
  </views>

  <commands>
    &FlowMultiFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvwQ2yCAejk5XpcyFAnp2c1i/1Zz8V0ne86tlwgVf1bVceGVZ4hC1gccswAHIz78ZjPl+70sR/TIXxIQ0pDoSMEbiZV//wgewN31cFGaVpiBxXKr77QI1pORbNt7jzElfyxJg90+XHjWD3OaDGzQLa1RX7SivEU1TCvYcwiz5K02bjjduECqKMyR3nT07yq6RinDRpVNQtSVTotgwLFw7LAPJcxqTiZTWI47U7HenIufK1D1Q6WmNF4JrQMBB+QWSZKphblxjuXeRllXy5rRSBU9kym7RWJnZajkNpnbD+6+SaB90sTvABc0RmhrryIOvFyOEDo5t4JcaKdUUK9PvPAuq+4q0XLeSN4fFaTwAMRB0rCOufmQpqQSa7wksrR9o9YMB3GVAAUsp1etF+Ni8ALJmNTczQrzpzeVzdJqlEhEqA==</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6Ejl8zko9cbe/JXzZ8GKMzy3y+w00rn5kwXGvDuh2H8vpsuARaj5VMSVwiD5+hIBYR4kND6Dz+sbli1JlP0H3uL9GZ7QHEntXIWiRrzGnojHNxYQBRZ155Q4+s30sys5wSL73PNFdYltad/iDcxgud18Z2kuFlmjU+DCZ0LwsgXE+A8Y2Z0Xs+kqRLtwjxf/cb/N+o1y+ALlq6D0sryi9hIo1e3D/+MFr+81o9tfMAhKugOs89J5tvgOKB1dtGPO4abAUqzsjw+TdMuCysN4gSwQ1Trr9mCR38j27SlciSQ0ZOunmdMbeFZaSnoR7PlAUYUxDs3eLtblRcAOlUF74pd9khHY+f2s5+xo4N8qcdxMh9MO/8U28OinyI9vVkv5MwikAGdbf037wac+JAlcYT6kBrGhYD44tvtYNP5ouFOHS0oWNVXz9DeAxIr8JLxu9ThbmUYmU8zDvV0I//K/qg6g+XZq4XQeaqqQGDQR78Jx+Qevbmr4SmMqLjzBeVXyCzMacyBnxxo2D10AkU8I5HUN5KziwV6L9oYGEJptCEyKrd74zJdcR9HYyDcb+34sIJjwlxofh2CtOb3ti+Q9dUI18dNWqmpisMY9PqiZij/hWIvf0l1CvX7PV6wimc2SuLiUS9pTIHIdGJxzDMOUSNo=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1RyD7txBWX5CJQkA1vnzVXDX2CbsrNwQhjEt+kAQhY+r0KQEPO7VFzV7xI2XJ9zJ4dYQIJEEpwblZN68Wlgd2OqbjSdJEJ4QtcH5j/K3g2p8+u1uviVbtbOz/r/8zLBl03s/SrcRwNAw7NFcipMYsh6d5DLMNsj+tWc3mGtielG79hn6xfnFkqv0lHfjcXjT7sIaMdeh/A+9VGDiulVIGA2Wx+/jLmEj0bqFlgrXBMh8=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLscCWbRcZdE1iJmWgnEI5WNFQJuYL51bNRmT1AhY1golYLpxBDWRKGVEno5dROldzzWlUCwws5N8mFnG02ecovJSAp2CApFOqkoTRpjmTH3ZJyPEsNO+kVw+uRAZKvVJFAs6WL49KZVri+xVj2Pi5VojKZyX4Ls8r7R4QqJ0w5a3aVX5e0iyhu2T4ZMMpuDFsvonhFxXpVWd48ZoKSOyOVwdPccz+/RVeGR7LqRheFAUvhlZslqgLZ7iiRvPfy+HxzbloBIhmAa69IUBaO31AfljA7b7jxDSJpDPATBRhM6VSbheo6RcfeHMhJyagchcHnDymHTu3ojmfpPF+lEfTft/RfDWQHLpc4WiqwOgFl5XwCCLTZ23KmkrTxhoaJi/Q==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2CXv3vMLpajZp9RsH56DUGa/k0XFjQq1ALZGxUpr48gy9Znaa+8/UKIgScvEUT8ToWqHA/pcuc5SzOiRJ3QgQ9tW//+UTqh0kYRcbGaMSq/LnIWFh4/QhDxr07BUEjJ+Ry90ukolqONBkXwUuRup49BSYVOeZMt8U9pI/uFBFP9kfrT5yywEQysPJ8PsHYGDYKiOILZZlhLOnea1GWMJHJB69qYbcmEkhr0ILi/qgbqS0Sg3u3pYXNxxbnNpU6ZXlsvrojeU9O/BHIHkF5+25x0fjXWhPwW3ig/iwa5J3U/iw==</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>