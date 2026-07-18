<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "SPInvoiceMultiForm">
  <!ENTITY ParentController "SPTran">
  <!ENTITY GridController "SPInvoiceMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiDetailTax SYSTEM "..\Include\FlowMultiDetailTax.ent">
  %FlowMultiDetailTax;

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c81$000000">
  <!ENTITY FlowMultiDetailTable "d81$000000">

  <!ENTITY OtherCopyField "he_so, thue_nt, tk_vt, thue, gia_ton, nhieu_dvt, lo_yn, vi_tri_yn, tk_dt, tk_gghb, kieu_dt, kieu_gg&FlowMultiUserDefinedFieldsCopy; &DetailTaxCopyFieldsBase;">
]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hóa đơn bán hàng" e="Sales Invoice"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BXvd8rc/406evJncGMTPQTsXrBsMujvvXdkk17/Xn0U17qco29dH8ij5BXlRtOZZ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvzruqTqSeLsRQhLFC5KUIeHR41EpNdHGFV6yctYti5EAfnimJvP+QcVLFFZiLWRKPoHoXwkfRBfFfcoQt69lz9ry8vBs/5xbgtEoGNivwDut5bINq59rk7iCMbbx9nh51MrHGW6HlAEPpqsFp7Y1YAU12txZo9MDkeorXxWorVYfXMDj9avqsxgbTssvO0esw1ZSPm7hrfr8mXTf8UWx6WAaBwcO7uKWzq+TIELXXMSeXCEI8YngsI+LZyW1lsfbo6YX2epVVe5WQbEl8dcFvuEiCfeNFZmZQa9lzPo5oLCKFV/QpdWg4s6YIjtTVMIHDTcz7D4IqXHHSVtZgHk7WKFZI65sBq/M+nk956esK+2RXMFMBuiV98/IzoRUfLOnpRGhit7PUKsILPfwSY/f+FsTgDmh+bI5M/jGJAL/Td9pA==</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbPnxSydT3PLmed32VS5kxJn49AVO1gJm0auGv7iOTp2r</Encrypted>]]>&DetailTaxCopyFieldsBase;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6FS5TaMaTMklm6PeTuQvIX8MCkALlJMtr40AaJ7SORdLrt60Ar/AH984xPh36rfcvJPpfv0u+YrS6tf+BZPFVaBQ3YpXM2XvqA7voQep0IO/g8hVBSduafonZzSHiEkdAEFJq798jcYH8KVp+QWpjPhbfWX5vTlP+kdOUM7sW/mpm197bst3YMZINKr4pedaZdbE+Ivqf3aEXTORlDZ7lpZtif0TqNz04KdTkw0/dadjIbDiCEGnog/89B4yUuKWLUjXBtrGqvroLNvL0VFtGFbbvnGDxwfoyTSdbMTBeVoJ6aOlM4/1CkP+sEwaw2zT3I6U7b/tLDbR4BnzbxWDgFLomB2BADRmgo2HyOFTHt9H/t0ToAdGGKLB18iOqy7vFHymU0I+12X88yIjedBd7i0/JTm1QJQmWPvyK62DODiCMsglYmfEFHa8XvcUoO1Dp2Qf/CC0K0EHHRhtuWk114cVfqfcGtZ8GoVJDZ6ZEqkf0zKUTA/LuRKBDwLUU11oiGGUTA3uK+lFN2UW99KNcvZZFbUp0e/0QJynKE0YrNkg</Encrypted>]]>&DetailTaxValidDetail;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyZ5RbJN7i7UJ9pCp9scdHw45Bfl3Ia0vW4+BF+kpJNdjjWjeyTCxwvZbUkIiFbXwQ+T16iDNROhbGNaXxN0uXxQfYBURmfnb0X9b52Q1KkrobsaR3RPBA4UeBEUPPeataBQrrfyDDKmXAd0vCjyxDvIUL8XB+jRv9HLLazhXZ9jC0yKfhcvN8h7DzuYtzUY8LaYofTTQrZLDXtXcLKAjLMw9mTg3uymnfUaNKVMZ5moPyV+svKi4wR79ZQMFdJ5PP3oAUBn0YL3hbm+jUz9MFUNFcTGssbED8jeTUN4Z8/KFUwS4qgMrVcyCNvulA93BjUOW/eRen+bqczlGm1/RZSYu5Gtv00x6pqH3mDnQxUtdGuhYkCSaozDqjoCbqPAsObow9koqRfNK8LVApKCwFgB7aQQvNGldZRu0TrkDW9qHnyCAj0CqA0Qnh6DZA6vByhEsp5Vllwt16iWrpmI2s3ZVN/w1yAlKG2exuLpUlUtJ5YXVBX8KyfE6ne/AaYar9g==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwObY24B8MrCpiF2ZzlquzAHYZ5iJvqkBGD6BTPC0LqGVlBXEC1Dut7tWA359HgmvdyBFPXfcU/q77A2zTD9OR7NiobdAeDY7ImDmfBvBXQ6vQnNsV153N2OLxXCsnA4Re/tX1FGC3e9eyHuHSXlg2vbqjgFfk/d9ygzWOJ5+aK0h2EVhVu9mO/jJO8ShBn1enppJar06zQ5KRtCm7XvBkCuHh0dCDcNO35Zf+pl6W+r95MOGvJN1yfP8kC6/Y+f9/g==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &DetailTaxFieldsBaseRef;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGIEBMAnm8Xq3uLCZlI0rLhnHkwdHnLe88WwPowFumCLM=</Encrypted>]]>&DetailTaxJoin;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4fhEmtpdaEdozBX9h6p9WXWWQ6H2hRqJnX+TO6sWOSGqRWE9MC7+9KeFk9RGIdnd6w7APGvxv8r2KaRC2I++zHB32L17uUzoSbvqeKYrk6tI0ySVxwhXPM4itN4ehkI9uVKPaQBlPGWvNZzDTwJQmRSKICR4WPSh54j6FzfCnBZ7wH6tcdUc6SXFkfji9r8T4JC1Vx/wvEJ/LfW7nQ+WIrfxGuVWQmB4a6gBOpEo2/Hz0/h8O9EgYrFdx2NBtKCrzuMkitV+v72pDe3ESdc95oNChgISJBUrPM276hV2rOjPGE4r6DwK/rJAW18kExEKKOuIi1cEfjnRWBoKQ2aeTDbUWIzh94JIR/tOgtbj1PDf</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;&DetailTaxFieldsBaseRef;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2CXv3vMLpajZp9RsH56DUGa/k0XFjQq1ALZGxUpr48gy9Znaa+8/UKIgScvEUT8ToWifkcFjzw5am41TmtetUI5/m38VrTA+/hyuklFWeE5QABAxuvqIubKDaWOqmd3V+m2ymAbo8WptJJ3+voO/aTE</Encrypted>]]>&DetailTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YeF/YCKyZnzF0P4nZ2ZuaTRatdcGee1giZMhRygKA3r4PP86IS5GDO0FW6oyMqJHFVofHmCy6BGgrPOZd0a+hDgWhph/jzRR/LRWKd9E3YeY+x+Tla8Vlj4IEgkW9ZCYLuh4SklIju/edcz11pbwjS30JRgDtLIqBIrX6smsgI1DBgt0+xIhJ2pEmoI59R+JK2X5zn7+OBiPcR7oe96P8zqZfhx7gxBJeXuXsz/hl8M</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>