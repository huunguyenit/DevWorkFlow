<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "SOQuotationMultiForm">
  <!ENTITY ParentController "SOTran">
  <!ENTITY GridController "SOQuotationMultiGrid">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY FlowMultiGeneralTable "c61$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, gia_ban, gia_ban_nt, gia2, gia_nt2, ma_thue, thue_suat, ck_nt&FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Giấy báo giá" e="Quotation"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFW8jUoJ2OTsvpyATT048ZGQF0CFOx3B5w1SPMvwnS1LFcoRSLRmynMDD/JFQTYMbFY2LkvXYLqGgLzhAGOAbpvBNVLyNPjz8g1Guc04EsE1adNke8ejRMKnEy/fkPHM9EVVx60RH6mXQO6BsmGIA8A+4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFeIhfEPI/HYYAj4rwamdgI5xlpb4dEGS3Nb3XijeLCdyIxjby2gzVAUhoIAIj9Vox/QqZ8omsN13FdNsnPE7r1ON5zXgAWQ7BwAa9kKee3adDTYAYac6lmJ6YmRrPr2ozH126QI2Ib/TuJg9ZyFH8BlokcZM9ZuoDUd8DwhZ/y+SDnZ5Y42V6bbb7RqIuQBeths9d74UX9ypXdVL8x4TSnytBEI9kN6G0EVpnLi64xSg7iB1+spGEnOwhLzRNp6qVG8gsgzxKHR5KpdobztS525jpDkUYW289h7ZlC37cV7ZcOwBlksHGjCQeVUtIu1kqmIiDDlyPej8d2jx1+vO/hKrAdbdRYoWnjjUzjxOtDsQ=</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6PkaOmERlqkt3O8okNu9szCGa0PZyeLTbAv8uiV527ApFIIrJlRA2UULCO/wp/7gi8mnDAC3WUETD0Jo+y+/fWuc+rq+4wpxjKmsBAth84oyK173fjQtPerkB0Gg+4EB+pkEFXaVAEWdwxlIve+urYCenaZ7Cg0rpd06SDMJ7QdTChGsqtA0y4y6n0qjl0iVxMFaEk+EMWL81j/fcgkG2+aw56r2Jw5N2h8IF5ou+riBnIpAQBRXqTDcPDXxbKEkg676lnBD00JVVfyZEiKhe6UflTb6IkvSUw0og01DvPhAiKqQB5Yx5C7MC+dNd5xCG9SgGjn+/JEpbx/SZud85cdPAfxO0ZllASbpYhdyKtBvkuKKjNYoAtbXPJtFu0wqDbaOcX+oSYz4Z0xKC3MGJBTPGc5JTEyNtbFzUw0zc8N7YPrkNIG3XqUdx4BH9utwPFBEklf5MtzQC3Y4aQgfVtIOmxgmGPgtR2FDiqFWwqinDP9sjTxosNj+WmJjCvNAaqdBVlLryust9fcvAcrMqh+eYfya+a+mhYBVA9m49UfzSgxls+KbjYJOm0YjIqaKWU/1CmL1WLIkrSe7wG9Q61pbbFvYoVzsAuhJIusK/xoWMIFOdPiFFj0F2UpDoVYQgUbRcVV4zFQt8gaGMUNs9rsaTa3EIIChJ69acUTVCGTHSkswTFVml2pRxGJKa6VfyAFLqkdP37AsgMUdbeN/0dTwQWb8Hy1NKnaAns4W4M1sMa9OyYGbhsCjaElkxtvODQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUya6s4f6ZKBMDWMEmMNaPiirXJLU3pjejUT8xoc2w7UzK2iBTbW1E3/o2FcZAugnB8LQzpPC+0pszf6Pu8WLI2+gq90gI9p39e29813AHLQOzt+u8s9U72bUpPWgnF+gb/gr5vmxF94t/LeuKn/aRZJR</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGzVpNGtW2tOwRIKmaZ1T0az+jsGzR4E+uZrr5E3xAXaeLqkC679t1QN7/g4VxF3K1D69EFaNN4ybhREZ/LU8bnL+CJRSuLGcuNKckbt0DRqIjU85aGVFRqosIhWkQ1xUS3fCqkaKTlWLEhW6QnurTOQBAON36Br93Tecu9JbrmVhmQvzXaJlq5baGCkd9S60tK0fiX9VOUIz4flpim1uYMw==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2DGP51awTsvcY7kSTIcxK2051ezQfBeeK5G2Z7o4L/mdIvicPsSPdK5Jg52J+/SjHj99Z2uHqjqxcUZIXFvzBpliSwYgqYU7QOJ5ukywec7r9iJf6W8QY2QC+1mcbXiKFjE/yXVWaWjTRMR8lKQ2NLq9bJ4jhd7E7lAp87xNbPNOgJ6BCIiSTKQ9OQTGKYCNmJ3JWEAlHIlRXcaKMItMbnxZYpEqlncdjp+iagadRhX25QMGXhOFb+Cs2Ug/p7PPMM4ToOvpK1EpihC5Lkx96p0</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>