<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "SRInvoiceMultiForm">
  <!ENTITY ParentController "SRTran">
  <!ENTITY GridController "SRInvoiceMultiGrid">
  <!ENTITY Tag "">
  <!ENTITY EnvironmentTaxType "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c81$000000">

  <!ENTITY % FlowMultiDetailTax SYSTEM "..\Include\FlowMultiDetailTax.ent">
  %FlowMultiDetailTax;

  <!ENTITY % FlowMultiEnvironmentTax SYSTEM "..\Include\FlowMultiEnvironmentTax.ent">
  %FlowMultiEnvironmentTax;

  <!ENTITY OtherCopyField "he_so, km_yn, gia_nt, gia, tk_vt, tk_gv, tk_cpbh, tk_tl, kieu_tl, nhieu_dvt, sua_tk_vt, gia_ton, ma_lo, lo_yn, ma_vi_tri, vi_tri_yn, tl_ck, tk_ck, stt_rec_dh, stt_rec0dh &FlowMultiUserDefinedFieldsCopy; &DetailTaxCopyFieldsBase; &EnvironmentTaxCopyFields;">
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BXvd8rc/406evJncGMTPQTsXrBsMujvvXdkk17/Xn0U17qco29dH8ij5BXlRtOZZ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvwQ2yCAejk5XpcyFAnp2c1i/1Zz8V0ne86tlwgVf1bVceGVZ4hC1gccswAHIz78ZjPl+70sR/TIXxIQ0pDoSMEbiZV//wgewN31cFGaVpiBxVTlu7Ge1U/PqhDahzHc25PKF4Uw2qP7abhHU1I3g+HOIuwbmyBgjRanBg7J3HI7STsnyAhLrx1nZeaw3RRI1K9lqlTBwCDpvKjQLJQi0ytIG5JHal1jaRzbB4Q9C/mU8nQnt+fgj564vYkkcKDMMsMotRi3zkAsmNRdb8M2jyrxn4tjXSIBBfKfz1hv+sdTgo4GfywB/Th4Uvg+FVky+XJsgF+FS1uJ4Ymn5+cBeuyvN+rjLgA2HxxZs7sFT5i99PrAtFiMAphpa25hGEqr4Fs3soPHwdpeFMO/+AI7gFqQdq4IKt5JBjJ3Qqhb4NeszA/S3w3gmdjXvlC5DnyUA4uDGZu7Zw2MmnibHJ4pzMvZfnHqNQYoecrEINtRtkwdGw==</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy; &DetailTaxCopyFieldsBase; &EnvironmentTaxCopyFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6Ejl8zko9cbe/JXzZ8GKMzy3y+w00rn5kwXGvDuh2H8vZ+V/UZZTno5TasVt6uqvRTJF9VKV9ajyRCJw+rcbEtiniFqV5ZSD8tiWzyn60gyimtyoEUmwRe/unODYyUh5ISNvIlM+HKcoae8DlWgeZCKZSZSvstbGEpU/bmpDKGnfN+tf+jY65/A+xBx1MQE8wwpmsiIwuC/0Sf2Sl00PhyGMR5TU+PiqosG6KNM3evXR/MIXp3zFMO6UM3fRzgwawaTOF/TxklN05ZSNHZAk1V2mqRewQ+sVtGlFO9muCdUcxzeX8ytQeoAqgTg+wsEJUNSwrvXqiGIw3y0eO0mJrV5dGnm/Pcf8kfGW1V4gKEp1pmc0C5jpJAay0FRoM1cofExwwvemiMaKtRJK8GprAihbXsc18NMAz5shMJr2dp4rwRLfHQfMoIWwnOJfmQlUATBZDCQjCRCFLEAmnwvDjTcIBRk1QnFEq5XU7l8hhOHRWPgem45FkKQ4mbiFlTTLgA==</Encrypted>]]>&DetailTaxValidDetail;&EnvironmentTaxValidDetail;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyQ3SEv+bD2ukcz2HNUGOil4sGKQfmj5WsNBMyjaILtaoojAoX+/ZX/FArCeIHiewtasIJ4vZFDOQrUgtlhlO8Ei3hPUkeRSNTIPkhsPKVVs0A8tfn8wXzWwIX56hC8VHsgxcQ2qg4zXUKXp4EglGC7XwKSmtCUztmcGI8VQMaP2TVNcqSh8b0Ffsn7fvLijp3w66oMkVlhpBU2zZZ+an1x9PgDik0pF0pdOCtjvwiJ9n</Encrypted>]]>&EnvironmentTaxValidTotal;<![CDATA[<Encrypted>&/c0GKkfLFdL35g16SLdKweg8HRS+N+y/FGdkCBZwTzmTCiXYrxMFDUr97t7oeJmu5mLJeIqYOeG0CJFWbPWs7vnslL9g/k2XLc7h9Wy2kIhc1cd2tOjVOh90TG1r1tHVSstuCiW4FAARSgZg46nRAGt8rEk8JZMCuO2jIDYIlQlHG7Bdli4JkWW57/pKiDixtEovHkuVd/HkOJa+OgKprhufAg92d95htIdB4JaqK3s=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;
        &EnvironmentTaxDeclare;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwMV9tSKox5NDnyaS+buHTeZQEK5ZpIYFdaBhkB2MhwTXMhePhJVR9O3urdqvqJTvOx1PDJV5i44k1RW3clUMw+MPl2BM4K7BCgDyoXwY5jYFt6Za7QhL2Vjiuv3NhlVru1JwQL9Cyk8SwpVbJSRZEbQKl93lDh3Pom1IDEo/OzDNRFFHbD02lFF5DCRu3gL01atUzo7TWN5b/ohykso14pcnTNljfXZo+dmDfkS8EgP5WCPycYeA3OgbiH04A+gMK7VF+SJa2uwqMXyqsmkjcBaSu02n/dQVHCPWdlB3AJP3</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &DetailTaxFieldsBase; &EnvironmentTaxFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGzMsxY/UncL8nn6FRIYysSNWZCXT1mcBKYuOvjKHRe4U=</Encrypted>]]>&DetailTaxJoin; &EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VO9NrLQLyO2B3vPMjlI5H82zyb/dXUtj41BpYKSXgzoigqqeiwJzX8SPV+2oVR7pQe2SXm9gjbKQnLkwf8/mx3C1TGLR6RUQIdevar5p+sfrwcD3RE+zP/quXOwzSsPN6z9dveq1aHxmvNFHsiOMBCW2b/GllOdrCnjW3vDAPcUSnZpkiyWSYdzhiXDdvEPOWsdVG0RyjSKR7m0fjXltvy3FfABkZQvBGeDSJfceVNNzKUgGyufEBIp4JIrAYO6DUcBFfoXF3eAB+vrW9jNs7LjvLlKTQSfli3Kskc3afZcmo2gqJY5iFxbiEtAYTfbmAaP1DIbufThojIQJeDN4PnDcIDj0qq+Sl5i2qSXqsu49XDKTLONq6u54YL6lXVPDwkg4GeuISY8fIDglBnPWl/Z4GndrxaTJtp3lhpH29ZR</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &DetailTaxFieldsBase; &EnvironmentTaxFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2CXv3vMLpajZp9RsH56DUGa/k0XFjQq1ALZGxUpr48gy9Znaa+8/UKIgScvEUT8ToXoNqtJycRRyn7T9AVpvzrxVrG/hAhMy/V1pPnh0dATxg==</Encrypted>]]>&DetailTaxJoin; &EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YeF/YCKyZnzF0P4nZ2ZuaTRatdcGee1giZMhRygKA3r4PP86IS5GDO0FW6oyMqJHFVofHmCy6BGgrPOZd0a+hDgWhph/jzRR/LRWKd9E3YeY+x+Tla8Vlj4IEgkW9ZCYLuh4SklIju/edcz11pbwjS30JRgDtLIqBIrX6smsgI1DBgt0+xIhJ2pEmoI59R+JHpY7n5f+yft0K8/hmPy190=</Encrypted>]]>&EnvironmentTaxQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA/vR4W7E8QKbPiDM8gRTXBqMfDyHw2zaB172Ku+6NlA</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>