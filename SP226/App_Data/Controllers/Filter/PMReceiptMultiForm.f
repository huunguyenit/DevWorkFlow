<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PMReceiptMultiForm">
  <!ENTITY ParentController "PMTran">
  <!ENTITY GridController "PMReceiptMultiGrid">
  <!ENTITY Tag "">
  <!ENTITY EnvironmentTaxType "1">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c96$000000">

  <!ENTITY % FlowMultiEnvironmentTax SYSTEM "..\Include\FlowMultiEnvironmentTax.ent">
  %FlowMultiEnvironmentTax;

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ma_kho, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, tk_vt, ma_thue_nk, thue_suat_nk, tk_thue_nk, ma_thue, thue_suat, tk_thue, stt_rec_dh, stt_rec0dh, dh_so, dh_ln &FlowMultiUserDefinedFieldsCopy; &EnvironmentTaxCopyFields;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhập mua hàng" e="Select Purchase Receipt"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFw/voS9KZylgJtC26YG33NZA+mZUyJfAwQAv+VYFHaTlfYmVsL7kR1dgCEjPYnUh8obh5fdCChJyR5SS4lWIZu1Bpj9Pa/gzdyHVVlHRNHWpuJVNpKEepqcsKjfSe4mg5+2uAGTVYtga+ms3gpZ6jtVU0u+es4HWTsZpiGy7xonhBaF9FsNGC+YzaOUHTuz6InEqhtbwot44S1pQJEmEq09kvFsmBhOwrbpzgbcHUHY1Lz8RftLPGa3vxLptUEaidJ7R2PT5Ew7ch89NWnJgsTP/JPmrPAAf2seIUDp1harzXSvRU8t187kdY7TswqJd2ZBO3z0t5kQZSm+4RJ7/vgkjzK95yGXL16doTgxchF2Ow==</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbHTwY8vGihka3WVRS/+JgD/zoildWvg08L71SAGU+4Fa+7x5OiriKIk4O77D7axUQeLRfOanVmCNm7CxZ9fkRQRhaT/zL/dl7zwUrOP5WTaH</Encrypted>]]>&EnvironmentTaxCopyFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6Ejl8zko9cbe/JXzZ8GKMzy3y+w00rn5kwXGvDuh2H8vZ+V/UZZTno5TasVt6uqvRTJF9VKV9ajyRCJw+rcbEthINptiYyMNa7+RZqlacfDHr4aU7k7aWYMVbyEJ0K2UbovsDdrIQdWqw01650ce7PiAUJOBwV2VVcUkUOBu5ZRH6y4tbiq9/f3+5jextpumSgtZCVK6MNQtwrcBIff3JV4j64xTGTR1/gV9JSKPBikztzIY25K+f5oYJh8LNys0v7dm6/m5F4/5gwEidirTscpvJK29p+MQ2QAkerde53Cum1CKCfJdKukfixV6hk36SCvPOz3lZOuh8aZJwXOjAUKcvPRzj0QpjtTOqKMsdNtr0pahI7TCl1QgGjp7vU4OJgCApJufqC9/wJk3ecS9a+K2rYxWISCIvwB/wG6vGiFukA8eApnGeSLCOvhram0Upz3NmCIQjh5WoXOVcXHZeqlx7T1Q2yqwg7m98Tjx30Xls9xtAmO8ZDivyLl5b4Cung==</Encrypted>]]>&EnvironmentTaxValidDetail;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyfCxOn5ZjJotVbJowC+8EkT6X3f3DvwyVLgiGIbUElBAGbEKBNCGhV4cGlxMt6KnnWtS5/NCheNP9u891TGxnf8s/G78SXFpZB+M2O4/Fk1P2/zMyJ3i9cuMDX+ryagCRlAF5o9O6YCV137y19FwWbblV0eZHpUvtY9nmDH1DlzD</Encrypted>]]>&EnvironmentTaxValidTotal;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyewqglBc0DHG+EFgRJ+cvANZOAInVxnEPUveT7Cde5iafr08BSOqauhWFjQwxkVrjdNS+q/Ps56O3C89fOH4+a5cyiDxrfc++cB/+LQO4qb5gU3P9rIwcLF5hf80FA3DXg==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;
        &EnvironmentTaxDeclare;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xTe1xPN/VnWbCbVkJ69OXinJjQc/xfgPG7uIeLaoJV3WlV5GCRg3JBiK3tXIQonTq6ykXBiyZptMFXJOfnFgOfIvsLw8qkf5BiaAxU4L0hMGjxOdeUoaNAI0Udfu1dp7bsRAfITpB804VR7XrknsSdky/InvD0GU1+Kv4+aua33X</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &EnvironmentTaxFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGpAXJEWerxwal/2h2K6xjoZXSLj+q127iCjvHKXfu6M4=</Encrypted>]]>&EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VO9NrLQLyO2B3vPMjlI5H82zyb/dXUtj41BpYKSXgzoDaP4ycE1zOLkBMRiHGnipcYmP84rSuJmva9AZPORx3ckogoJmRFCBR6DpngdU3qMcfv+k9huVZ3e9YNLomZbiHlYFkv5VNp7tWueKRY6qAv3/LHwRnJerYUyaJny42VlQQImoNNq7USfkK01yXUG5VMxSUb02JI1DYef5Q5nJy1h3WIXvcdcigcvKXLWwb81CiHk8PhzcxibmivjMaml9GUeMeEUQTPXHbQ/OXEOG9dDjiKDEHx1LbECPqE6ImUXpbPIruVYDm8vNIREogIEoyUnw2//uBaKXWDFeWZfQQcOqUpZlBRdsNoRUWSqLJMk</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &EnvironmentTaxFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2D/LLibhLyXv/Jn2KC/jiPwS2hinTZbze7M2s/e4qjvqgdemRtz8wPj9Z5ktoUh++enRgk2JGSpocNA7qwbxi3Xb5bjQcRfutRq7j74GqVCBg==</Encrypted>]]>&EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YeF/YCKyZnzF0P4nZ2ZuaTRatdcGee1giZMhRygKA3r4PP86IS5GDO0FW6oyMqJHFVofHmCy6BGgrPOZd0a+hDgWhph/jzRR/LRWKd9E3YeY+x+Tla8Vlj4IEgkW9ZCYLuh4SklIju/edcz11pbwjS30JRgDtLIqBIrX6smsgI1DBgt0+xIhJ2pEmoI59R+JHpY7n5f+yft0K8/hmPy190=</Encrypted>]]>&EnvironmentTaxQuery; &FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8JQoPadc4xmj0KPgtk5CAcAT6y3eTnMBPq48gIOL7ncuLChnLyecrrJTm/MaZxZXW8pFwbA5twRW5pZGooXH4TiWUm+sLRaBN0Q9rD7IHNiisw1Eyze+CsN7aTtx4/Tk5ByqeOyJy0iCv5xfkuNbVk=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>