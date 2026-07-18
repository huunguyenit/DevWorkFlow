<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "hrTSRequisitionMultiForm">
  <!ENTITY ParentController "hrTSRequisition">
  <!ENTITY GridController "hrTSRequisitionMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "hrccyccp">

  <!ENTITY DetailTable "d13">

  <!ENTITY OtherCopyField "">
]>
<dir table="hrccyccp" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu yêu cầu cấp phát công cụ, dụng cụ" e="Select Tool &#38; Supply Requisition Form"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUsuPjWeB/vPvw+UJwZO7tBoBaCybIxT6FK+fJgC+4gehqbp7CdOL/Ap4Bn3zOZF9Vzy6AjVUyBvnWVnLBbEOojbTp6YDScGGlaeSpZtwIRbybw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egSe8qyjLp1rffVY96Jbn9H+kkwUB3EkSCAIVGmDMbEdb</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfc93+mL+ARjvo8RRDTVfIgPbMpZfYk4DYXJhd8srbOX+nJRaBNhQ0r7+ewJsF9a21</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKS/QcbMrzDZcy91CV2WQ+9osWHzpziT7mdXsRP5+5V4FQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHyuJfbTeKck+fs2Y/+gWPWODiwZTceD43hcAUks5ieJG0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0LxHBdHNZJHv14b3Nu9pxv9feJZfprKL1zh+NP1deMD68HBkEhSq4jHHsL86ybj9qlw3kF1fXyPD5I6Vc1CLUq7D+mY5/YOxEnAGMUTnmdhaOv2FIK+rhJhnMYwCQnv180aBZ5PHpuIOp8fajEGGK1lp7M/hT2ceSZohFMLktKN3P</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XvSYha1CUCJVRywqjDLIOaZkd0mFUjkIVbWWXLWyIBR</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFzQG4QYhHhPMT1uUC6kWm226+h3vQOzxggAPGu72nTa0g8DJPpDgEmISLl+i3pNgrGxdXmiP99062Ljbmkq5fPcN5bzZprhA1ye8/EUkAdQpoQYZUEw7JQ73GpPriUX+R0zn7EvDP8xMk4BtVEXb9CqiZAYYG2WwwBNmpFhQiZU3LBXPG9ChP+OUJh2FnR+WIXubmP5lJ9wTOR7CWEM3X/wpA4E8qMxEgmb5e24L37fCTdwEoBHMx1wkJdcuZUnnjF6F24y70EA8ZjEzWqVXjdgknKQ4OOz2x555+cE0uenEYDIEsfkmVSfv61f6VJWVtakERWcWzFQ/j5hU+Q3bLPo4ndhbEAWH3ai7mQ1jS+RF3eGAnMvQJ7yVFdWzaLdHcwwcMdEtpNhmLP9E1yhKWRO3XrnmTwY4Zzy6cHg2UyF8MsXImUlCgjSL2G0SuJKyiGXDr3v98AsSCZc3Mk29exYNhEHgh15LuI6c+99nhpPkIxbdYJm/MxmHeykZTg82HonLsxPfptk4cPrryUJ9yJdhVtumprRdjvcrkLf6lhqeL5hxNy0ppwlWpxKvBRy3pA=</Encrypted>]]>
    </text>
  </script>
</dir>