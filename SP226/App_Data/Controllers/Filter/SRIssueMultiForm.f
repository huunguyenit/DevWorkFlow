<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "SRIssueMultiForm">
  <!ENTITY ParentController "SRTran">
  <!ENTITY GridController "SRIssueMultiGrid">
  <!ENTITY Tag "">
  <!ENTITY EnvironmentTaxType "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c66$000000">

  <!ENTITY % FlowMultiDetailTax SYSTEM "..\Include\FlowMultiDetailTax.ent">
  %FlowMultiDetailTax;

  <!ENTITY % FlowMultiEnvironmentTax SYSTEM "..\Include\FlowMultiEnvironmentTax.ent">
  %FlowMultiEnvironmentTax;

  <!ENTITY OtherCopyField "he_so, gia_nt2, gia_nt, gia, tk_vt, tk_gv, kieu_gv, tk_tl, kieu_tl, nhieu_dvt, sua_tk_vt, gia_ton, ma_lo, lo_yn, ma_vi_tri, vi_tri_yn, stt_rec_dh, stt_rec0dh &FlowMultiUserDefinedFieldsCopy; &DetailTaxCopyFieldsBase; &EnvironmentTaxCopyFields;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu xuất" e="Select Pick List"></title>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BXvd8rc/406evJncGMTPQTsXrBsMujvvXdkk17/Xn0U17qco29dH8ij5BXlRtOZZ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvwQ2yCAejk5XpcyFAnp2c1i/1Zz8V0ne86tlwgVf1bVceGVZ4hC1gccswAHIz78ZjMMTauF1s3nkZU9H09ve24GFVQmkqhZytOZu2nxnFAfZFKVAiBZ7a8V7f/4W1X2he5+rkS5tELFxFyI0YWLcAzLkiCnZNo756ZwUdrH0950OjgcGs5Q87ubbch08i4ETcwGl6unqBg8X13JkoJxCgoOCoDKex0EXUTTdM/Vj6uHhreeKKm8/pkl2jHTP1C6UP9hwXpbpDRsiFYH5k0lKxjlDPeGZheUAx78SfoVZdaPp9nYNV1dKVPApRSEPj7k9wj7bboh8qT8kpUOYH7zOBCBqTS2yYXv/TQ8IWQFEP+klhYqFB+PRFDHsedHmxBaVlWHG2gnc/F9WlkyBchEmM42s/MhS515pxsENBsoW2cG3ydEb85gJ6J7dm5DgUsGSayUrkel08pBsbt5OR5640oh</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy; &DetailTaxCopyFieldsBase; &EnvironmentTaxCopyFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6GwzlPkFqXnzJ344yeEfBbSncyJqWPbSNmzMdznQYCL2rTFB6gOhHEEt1oGQi1fvrOLAda1nlaIYj07n8v4xdKsNyxrnuOa1a9R3bluixxnxsSbuFABKx9N/KRDYYqMOwq1P3+PmNz1hMyUplqDf+/WoSy8KU0z1AbDuMtW4DSHCZWDdTuLqXA70GZAb3nm6H3Zh9hV0YoHtW1F15f0xonfDWnm8FnBlr/aYxw5XPMXpflKBFU/PKSZEOW3ADE1xdqrtiUFpROQZCq7Gfd+TEPmwRRmLCDF43Q3B4TXGMPLH3xw53igzFHkcqMddX09qo4obNZXVV7P/Iox7XD1WqHMB5kilC7HvdVA0k30HOQEdMcIuERHhqGHkYvcQgc5I25QgRHq2maWzUbmcK/savfBvpKYl9Dfh1NuyeiIV6l+HPTeL5JJPvXACYHV9rC4DCAVaFzWhXj8+F/oSkn9WEs1eVy72mfoQVAboX7A0RXwc</Encrypted>]]>&DetailTaxValidDetail;&EnvironmentTaxValidDetail;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyQ3SEv+bD2ukcz2HNUGOil6tmpABAl3le3n1Vk0skfSfR9c0u7WSrJ6q7n/FcmThi/Hdh+ofXIj8pnvnKRNy2DSreip7HtkfUMBLJQcb5KbOzogJBWb0mGLMkl5zC38OUgW7iKhKcYJydG+NaIDYbiSsv2qOIW1sBDW/9rJJin5PXFxQ1M9jFS/Rbikv3bwX1dsan64XkZzgI6dhFv1cCBDB3lgMBFr8jkXgc8LmuFXH6nq5erBNzEjOlJI27x4Y4g==</Encrypted>]]>&EnvironmentTaxValidTotal;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFycByGlvAdtpFKvptX3ZQboCOmEYthtfGe9EisYM+N1Sav2kCnDMKAIo5J05QcB3TzLiXs7nPYgMtT33PAY2LKxxa6TSjEI27VCD6y5F+SN20wUwIKvxJ2Bx+HUM8xj0VNrTIViUvUME5pcE60Htcb5lj5MmCl8A2H0uln4U7H3IM</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;
        &EnvironmentTaxDeclare;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwMV9tSKox5NDnyaS+buHTeaF2CB87KUF6LOAfG8duz7BJ9nZ/m+4iYDpBqh9EJnSSzPrzAWDvt6Owv/x0SRYaw1kr/TYc1rlG5hHPaN7Aw8xq/0Rot79VIpBcWnHABMhmh9I1XqJx7vV63DxFiS536SC48h/ztSX5btbcPYdJfQjHQE+jEzZrdc/MYyDyBJZIn6B6PExx39CsAhCy8U0qUqTS2LwPzjd4SdWwADQsfdSGyfy/maMJP/zgWOIgp53+Q==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &DetailTaxFieldsBaseRef; &EnvironmentTaxFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGODfCvY3D80idzl9swTJPdQpw7DYw1sKjWqs8Ff2uLTg=</Encrypted>]]>&DetailTaxJoin; &EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VO9NrLQLyO2B3vPMjlI5H82zyb/dXUtj41BpYKSXgzoEKEDm5eus0iGxjzthC6jP1sf3vNJQ326PrTAxH1D73sWs1gG3sDlrryqZW/MD19a4mHyUidGJ6XVi8WrIF9TtdUeVBIZswzq+MHl2Y2nsUedrlUyW2Lv5bOcdlWGLwRNFMsOjLxNdkzx2t8Fw7iVVAtjBwGHLKcIYwN0+spFYswP5C62lIoEv6IlhI02icnfddmKPspiMT78CTiK9B22d+SFJj5XlSHVPqKzUlXSaVfeQVbzJu1/xxK6AV3vlneBJLB+pGBhNwZvjbdFc06jQI9kyPTNZW7K6Rv2BkWQ1Kk8pygm77bWeuQJ7vlyoHC22U95ramlDvRsSNdkD4ITm0kLpcsa3qH/v4PPjEA+dUg=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &DetailTaxFieldsBaseRef; &EnvironmentTaxFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2AFKMZK69s1cbGlzQ8gSvfAfkcifyZqEDq26oX0oEPCZRhvSH50twBMvNdfaKIy1OT3XHCECttuWxI9OAi1pN9RujxqGvGBE8VnCeHMvbhy4Q==</Encrypted>]]>&DetailTaxJoin; &EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YeF/YCKyZnzF0P4nZ2ZuaTRatdcGee1giZMhRygKA3r4PP86IS5GDO0FW6oyMqJHFVofHmCy6BGgrPOZd0a+hDgWhph/jzRR/LRWKd9E3YeY+x+Tla8Vlj4IEgkW9ZCYLuh4SklIju/edcz11pbwjS30JRgDtLIqBIrX6smsgI1DBgt0+xIhJ2pEmoI59R+JHpY7n5f+yft0K8/hmPy190=</Encrypted>]]>&EnvironmentTaxQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA/vR4W7E8QKbPiDM8gRTXBqMfDyHw2zaB172Ku+6NlA</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>