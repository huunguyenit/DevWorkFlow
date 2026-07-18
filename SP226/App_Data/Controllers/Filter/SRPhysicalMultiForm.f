<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "SRPhysicalMultiForm">
  <!ENTITY ParentController "SRTran">
  <!ENTITY GridController "SRPhysicalMultiGrid">
  <!ENTITY Tag "">
  <!ENTITY EnvironmentTaxType "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c36$000000">

  <!ENTITY % FlowMultiEnvironmentTax SYSTEM "..\Include\FlowMultiEnvironmentTax.ent">
  %FlowMultiEnvironmentTax;

  <!ENTITY OtherCopyField "he_so, gia_nt, gia, tk_vt, tk_gv, kieu_gv, tk_cpbh, tk_dt, kieu_dt, nhieu_dvt, sua_tk_vt, gia_ton, ma_lo, lo_yn, ma_vi_tri, vi_tri_yn &FlowMultiUserDefinedFieldsCopy; &EnvironmentTaxCopyFields;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhập" e="Select Goods Return List"></title>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BXvd8rc/406evJncGMTPQTsXrBsMujvvXdkk17/Xn0U17qco29dH8ij5BXlRtOZZ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvwQ2yCAejk5XpcyFAnp2c1i/1Zz8V0ne86tlwgVf1bVceGVZ4hC1gccswAHIz78ZjOegKAZZdFnKRjrbdzU2UKRoIDtKTBNbuNJYo8UN5OcJhp5bqPXi+WHWejIRFytmSjmqbJIxH5CwyTklytUyI9CYGqZAxHvfjIT/vCn73jgNcLzBKnXu08CzyKZVv+2MimeKoXpdT/5ua1ZpUOUDp6fD1mcLiaRTRU5Pjm6cviWonwDsyC/H6HjR/nTyzbhCXqlyPTryIbr4SNvEGcygeky/y2FAtpUjYcll7BY7VhATsq6jQzuoqI7m722luiI5EYUnQn7mVDtJH6d5M3Skh4yrxATbgkUCK0tqStFy7je5JpgbBAEmpIAjw5wcFH3iLhpTXu43G+TLfKhkYOdUnT20YEvDrzkeX5RO2qjT31r62xgmfaq8yEbfD0vXAbMwReQIaPjPa9UnnaohTokxy2y</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy; &EnvironmentTaxCopyFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6GwzlPkFqXnzJ344yeEfBbSncyJqWPbSNmzMdznQYCL2rTFB6gOhHEEt1oGQi1fvrOLAda1nlaIYj07n8v4xdKsNyxrnuOa1a9R3bluixxnxokyquPuW6O+gtHZlkrAWNS8F1o5wDlRFwPzZsuFZYK82aMtyjkWwEquZrqBTdooX8FD+2IbsIXtXuJpF22bavA3gydex4dS7+P2aj/86QC2muPkqC9mHwIW76jamXFkrGRKLZuzeDn9FGjX2xBQUqr9CsdhkyytfC7WQq+vz6ZNNf5AYw4B1l7dHMlg6HDdHIFTR3K6PaSGV9RoJRetUJoqzIlhwniiBuiRwWgx/tGJriQ5xVN8iOfbCVQZ+e4stcSvxW6sGsx70YmhVdaVjy9P/vlfYJTPF+7mzTyodPKjrvZZxG1TZa3B/5z1DF65mMR7q3ciUPaGo/xrYWPxd4zDFlo2eUocmjeApscFggCg=</Encrypted>]]>&EnvironmentTaxValidDetail;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyQ3SEv+bD2ukcz2HNUGOil6tmpABAl3le3n1Vk0skfSfR9c0u7WSrJ6q7n/FcmThi/Hdh+ofXIj8pnvnKRNy2DSreip7HtkfUMBLJQcb5KbOzogJBWb0mGLMkl5zC38OUgW7iKhKcYJydG+NaIDYbiSsv2qOIW1sBDW/9rJJin5PXFxQ1M9jFS/Rbikv3bwX1dsan64XkZzgI6dhFv1cCBDmf51bDCFFvKQXBnoRUHg9ltfNRhNzM48JGumE+oTivc27u9Wf0SMbO5dGGmdfLQI=</Encrypted>]]>&EnvironmentTaxValidTotal;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyeHkDRGVplw8TUkIGSoJAUBM1XrMDg28XfMDSA8/5o2lKODdPoztQBBh6/i2aNq74YBCTVPcxJX8vJBttX31dPk=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;
        &EnvironmentTaxDeclare;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwMV9tSKox5NDnyaS+buHTeZ2YcjSCZ9m2w6//NERyYsmRXmeE2PIx7nCX/OvJLmoFK3+/lcNNBP5IKRdScJrsKHmQ4UZx+yhIpanbGM2xrO3tpeb1sXat395J2APxXKs69+XCDPqXhUFe0PiNKnVf1wD0yFjgiZiWrJWQNq/A7TeZ+dHDuNh/JOMNBkEOpAMSR7fB8fSNRdCpDc+ym0nFfNh3qtST0nfV3jAXfMPNAC+</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &EnvironmentTaxFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGndPHGMB56tlmkrkxVn9qlNSgRkAwETpoomIuJn4CcPI=</Encrypted>]]>&EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VO9NrLQLyO2B3vPMjlI5H82zyb/dXUtj41BpYKSXgzoEKEDm5eus0iGxjzthC6jP5mvzSKsmromw42RPlX317hFTnaLcCDzB3P7Y8yEzAslC0+Hmck5m/6d/9NiWPQgOQ9SZ2mJSwZmEwIr2mn86UebB+nISP7x/otPSH/iECLRtYcVDZHPe6TkgdloKTh1hz4LP0gaYGHT/SODvTVjoVDoRZTFbm3qvpSALfkzAHA8JiuXGTYa3Z2tkBmwNudA3+w3xwl+XjCu9KRBzYOJjc08cGmOrsKpMxXzOKlK8B4rkFY4KkDoK5iip2pW94Kaz1ukKRONARkDDI1YmM0naaxQy1y+cId1zu/1IV9ZwlSC</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &EnvironmentTaxFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2DEFVK4gLEMgzdqY32coibt25fEtr6uzRmb7tUoJqmrYKBXhJOpQwjjjD17iuNA5KVtTq/V3q0ILTr6Bi8YtSP0trpiNQAw2t/o/qt+QKWIKg==</Encrypted>]]>&EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YeF/YCKyZnzF0P4nZ2ZuaTRatdcGee1giZMhRygKA3r4PP86IS5GDO0FW6oyMqJHFVofHmCy6BGgrPOZd0a+hDgWhph/jzRR/LRWKd9E3YeY+x+Tla8Vlj4IEgkW9ZCYLuh4SklIju/edcz11pbwjS30JRgDtLIqBIrX6smsgI1DBgt0+xIhJ2pEmoI59R+JHpY7n5f+yft0K8/hmPy190=</Encrypted>]]>&EnvironmentTaxQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA/vR4W7E8QKbPiDM8gRTXBqMfDyHw2zaB172Ku+6NlA</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>