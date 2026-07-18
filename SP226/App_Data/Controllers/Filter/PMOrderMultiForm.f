<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PMOrderMultiForm">
  <!ENTITY ParentController "PMTran">
  <!ENTITY GridController "PMOrderMultiGrid">
  <!ENTITY Tag "">
  <!ENTITY EnvironmentTaxType "1">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c95$000000">

  <!ENTITY % FlowMultiEnvironmentTax SYSTEM "..\Include\FlowMultiEnvironmentTax.ent">
  %FlowMultiEnvironmentTax;

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ma_kho, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, ma_thue_nk, thue_suat_nk, tk_thue_nk, nk_nt, ma_thue_ttdb, thue_suat_ttdb, tk_thue_ttdb, ttdb_nt, ma_thue, thue_suat, tk_thue, thue_nt, tk_vt &FlowMultiUserDefinedFieldsCopy; &EnvironmentTaxCopyFields;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn đơn hàng" e="Select Order"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFxAZzBvBabs+abMCmRAI068W610v6/bpKU9+17nW7OJqk4JzGc9l8Y0gbjAJyQb8yy1tpMgfPQXqKmw6R0ViHT+CfQTO5m+KgvKoIJJnSuyUk39ATyglYuSYD1hLjmLJ/HG41mzm9JcN2pzaQEcavUeZAScmjYL5RwQKVizO4N4E3wZloNzVqZaKgW2x7rrLkEL1iDLIkODMBCC4ziXiy7d1SbMwdBI1Av8ktpAXvCGlBcNiFQafUK2RMNB4zmywug90ByLAEjAIaaJ98dC1EiWiqgmYf+gx5M8CsVBb//FTRqeQ+C+CIppfdA+s0X9g7McIguZ+mzwyYkZd+Eakx+0</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbHTwY8vGihka3WVRS/+JgD/zoildWvg08L71SAGU+4FaRb0fdxGKYbzviZ31GHXBkp71ULoYsbqyHnX73EuIAjKcLc2NqubnxrkpSJHh1cHW</Encrypted>]]>&EnvironmentTaxCopyFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6Ejl8zko9cbe/JXzZ8GKMzy3y+w00rn5kwXGvDuh2H8vZ+V/UZZTno5TasVt6uqvRTJF9VKV9ajyRCJw+rcbEthINptiYyMNa7+RZqlacfDHr4aU7k7aWYMVbyEJ0K2Ubi+nSxlYN4EP/cslECLsTzCiX3EeJIdLhDc9RzQU57RTD9oods9SVWrKBMvxeVnzlt0WyNFniLfBYMvo69u03HfhyzW9UF3bcB1R00EU3VWzIOVpWasrZ6NOvn/7KZhxtnRd6U4trw/kEvnpd+v/MReTfeKNS8cpgTfnodTlDW0ULN1sV93xUiHOZ5MU/chykQna2rQ127tayxsGeO/sqLJiajh3mr32kfJy76OTN/v5oAf4TMjs38zjPEsv9LktZxEOsF0Wvk2Isay9Y8Tx1VsNprdaGqnfvI214xMAkV3ot9lQ7rz5W33r7vM3o2XBxOZ6rci4lEaJIQ18kiUHFCq6Of3fbw7k4RXKG1v5Iboau+4rSgyY9wcXU7AcJhwWvw==</Encrypted>]]>&EnvironmentTaxValidDetail;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyfCxOn5ZjJotVbJowC+8EkT6X3f3DvwyVLgiGIbUElBAGbEKBNCGhV4cGlxMt6KnnWtS5/NCheNP9u891TGxnf8s/G78SXFpZB+M2O4/Fk1P2/zMyJ3i9cuMDX+ryagCRlAF5o9O6YCV137y19FwWbblV0eZHpUvtY9nmDH1DlzD</Encrypted>]]>&EnvironmentTaxValidTotal;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyewqglBc0DHG+EFgRJ+cvANZOAInVxnEPUveT7Cde5iafr08BSOqauhWFjQwxkVrjdNS+q/Ps56O3C89fOH4+a5cyiDxrfc++cB/+LQO4qb5gU3P9rIwcLF5hf80FA3DXg==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;
        &EnvironmentTaxDeclare;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xTe1xPN/VnWbCbVkJ69OXinJjQc/xfgPG7uIeLaoJV3WlV5GCRg3JBiK3tXIQonTq/jDTb7N3/BqmLXGYcczr3TBc/sHNhdSHuMlNUqQ2HGEX+6kUuKg9ufUsAxiaLFRqagl3FGljy8rCvhkn+UJ5KuVSdQ4Q6eLvGNj6MoxrvXO</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &EnvironmentTaxFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGA5kM6gb2GVAV4BaqtEykt5BPXIyOwO9M8moMUnK+oy0=</Encrypted>]]>&EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VO9NrLQLyO2B3vPMjlI5H82zyb/dXUtj41BpYKSXgzoDaP4ycE1zOLkBMRiHGnipcYmP84rSuJmva9AZPORx3ckogoJmRFCBR6DpngdU3qMcfv+k9huVZ3e9YNLomZbiHlYFkv5VNp7tWueKRY6qAv3/LHwRnJerYUyaJny42VlQQImoNNq7USfkK01yXUG5VMxSUb02JI1DYef5Q5nJy1h3WIXvcdcigcvKXLWwb81CiHk8PhzcxibmivjMaml9PqwZ0cE2qgeRLom5pq+WJC/Wq656SBBUXZNKjQ+pPSrT6t5wr70fevZW+L2G/1GS5aondZGf8H26C/RRwQlI7+cSCksOLqyXpj2E8ewOO1i</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &EnvironmentTaxFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2BYw4ZTnenQGyUf3WncwcUujEiMAQ/U9xJMyvEKQSRQctCkwHbmupJTS9XzLATd8CRGCokSg3ot8LwGfqqISrhGvRU6xEtP88Xd1cgd+HJPqQ==</Encrypted>]]>&EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YeF/YCKyZnzF0P4nZ2ZuaTRatdcGee1giZMhRygKA3r4PP86IS5GDO0FW6oyMqJHFVofHmCy6BGgrPOZd0a+hDgWhph/jzRR/LRWKd9E3YeY+x+Tla8Vlj4IEgkW9ZCYLuh4SklIju/edcz11pbwjS30JRgDtLIqBIrX6smsgI1DBgt0+xIhJ2pEmoI59R+JHpY7n5f+yft0K8/hmPy190=</Encrypted>]]>&EnvironmentTaxQuery; &FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XSZvjMoto7NZDvS9XWsfFjYmaZx8VOZfsw/jRB0Pdv/e8+zLbNnKR6DXMorhFjFtn/W9/jBVsDmuIP5Z5lGj0YnDdxxAMb8imngOS6mIoonFJS+qqQ2KoRgT7mfLAt8DZWPTv7tp7Pntzaqf8eXCr8nqeqsh/It7t0t8sqqdgtoh2/yz3vWHUylvO2NHkDKHcJ5xRXQESKUmwMFGNX+RYU=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>