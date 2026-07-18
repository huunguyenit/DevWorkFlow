<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "SI2InvoiceMultiForm">
  <!ENTITY ParentController "SI2Tran">
  <!ENTITY GridController "SI2InvoiceMultiGrid">
  <!ENTITY Tag "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY % FlowMultiDetailTax SYSTEM "..\Include\FlowMultiDetailTax.ent">
  %FlowMultiDetailTax;

  <!ENTITY FlowMultiGeneralTable "c81$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, ton13, gia_ban, gia_ban_nt, gia2, gia_nt2, tien2, tien_nt2, stt_rec_dh, stt_rec0dh, dh_so, dh_ln &FlowMultiUserDefinedFieldsCopy; &DetailTaxCopyFieldsBase;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFW8jUoJ2OTsvpyATT048ZGQF0CFOx3B5w1SPMvwnS1LFcoRSLRmynMDD/JFQTYMbFY2LkvXYLqGgLzhAGOAbpvBN11DcKK0zpOkyBJsW5aCI9SjTvqIXpGe7GPPI8+up8BK6tYJq4NQENH0xGglN4rg1WihykPwwme7eu0tc88xyS</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFxjDPSkh5W7G443vCi530xUsl2d/3gZLitrQ1igpzS01eLda6cDOwTySXyABFim8/nuk079CmN67EeG/0ROc51sViN21Ysxm8aynqH3uwdgr/ui5DRGs3z294g0Sy5Zrt32I1++GsYpBmMdbHjDQDlclRzo8lne1uXRTMLfcZXDzyopUu0/Si7Lo5O/XKPgpE0+HU/O9Vc+JBFM+zVWfjfEJ24/jigZWJhz7ofgqeXBAtmT1tkYTn3VB06L/xm1Suk2LTNEGveOEXlCFt4smgQDY4TSHD3bBGehOodsj5PX6P4KgXOWH8c7Q3M/LJtJX8h8TmecPA/KPaaXL+boEgM0</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLoH10/8YUkcCZOfbcMYWm8ZPpmkG9um07uqScrUNpFqsrbQFKu4E9i9yxpvnpRQJNZ6sgGI0zyNqz9XhOFWVsOv</Encrypted>]]>&DetailTaxCopyFieldsBase;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6PkaOmERlqkt3O8okNu9szCGa0PZyeLTbAv8uiV527ApmCGF1vg6mb1IQyuZxHHMXF0E3tadd3oyf+O04oEnUDbmImB/9nvI4GX04Hu6IvPGN5pny4X3lbCrOXjnMMl9BHTiD34WPk2hLEW9KUWbD6swP1kzKhuqBezlPPAVTV6lSay07FVDL/Ko21VTOGDrZG3WF3EIspz7VArq7wPVDay8ZRoffHRW+Q4nwG7k+m9UezseuCoDMWegGd082Kvx0oeDVuOA00PfuUkUyeL2BUZC4JTXp7sTqGmsZQKkINbg79yd0pxk0wKeG4mKwNxeVmtNRkzHHAurp0gXgvJOqKLcqwu2zSaXogxPEk7HOh8QcXqE/XIaommn+my2kmrfg99PYKymEkGTkubM7I3UubWt2DTEJMGCKNWmTkgPOHO2wtpHgdQX841kHIDDZApmVBf40RuAyN6DP5FxHc582u5zoMP2GK56FDTYRtxhMpStCgQShq8hVgEmT5QDus35bMnj0QBlS5A1AhSy7AjH6WYeqd+kszPDwx7Y7yxiUu5qcEsWoz1HVoRE2JApInySjIqhohVTAE/WrYlltMx0rqDasbYdZus9ecUfAlkYORw/KlOzuVhUAX3+zJP69FPuv+2lojtfj/v661xta4jzCHhJ5+bYMLqrhSlG0mUUAkrywgsNMn86AmOOam+7RltofEvAgADdPxTRiRkejtTkPbX8d/l/zVMqnWFxd1CRsFkNhsu1gpxMyJaxny8lrNzrWhJY/0XfBdGF8qdaLnjBu9ILAZVDHR7NmTebEho/rX4GYFjlk3roKItipASn9vGz34kusFweDfwYQPGvNQovjqh8/S+lsExGnS9c5YQvkjauRgSlPhJhEIua1yS+Ml2YTgORyYKzu8t2CF2alcMuOj10CeSyvEbx4blzNOzUcfXk2j7CZM3gpER4/8MqAmmBK1RXHTx9wp31+7VhZ2b7A9AvcJKUR4QyxLMsUr5Qe6/On5fJ2YmgMfcTd+TP50PktTqO2J3G1ikyHBXSmYLemjpMA9jhDJd29+JOTXwS8yCS7M1WHrtTp1RitIZczJHmByp8DFUhw7VdyfWU52SM1B800IMzFzC5e1sHh5rWCazjqTQUzUPgAaJonTcE5+iv+8LFeve2Ret7XQCHxXsVcKmBjY56BVpNgQxBZaHRqzYDaIwS0easaGx8YzqqWlOx8CeGr20Szu0Icbrw/WmMv6FmvPaiZPOIyjyl4GEmyepoOOmDon76frs/m63y+pBcy2eTVl7IAaOYdz2cWPnbu+I=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xQyRz3QQBC2nVplgQuuMDcu6pRkgg9ap81NPVuQiGS1HXxgQWdAReH52FfGM+prhacE3xaIZdpJKBvBx3Vr0foZWlj7zOJiZwIJsfWFcz77deUea9M5Le46IeAFRh8cEk1jWn/bs29v3C0vh+/JbxIzbOpVGbSn8Z8rZLVVW3hYZ</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &DetailTaxFieldsBase;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGVNGaFJh3HEYVHaqdm6BuPVxGvw9uu5ctTHVAWJdLF5E=</Encrypted>]]>&DetailTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VO9NrLQLyO2B3vPMjlI5H82zyb/dXUtj41BpYKSXgzoDaP4ycE1zOLkBMRiHGnipcYmP84rSuJmva9AZPORx3ckogoJmRFCBR6DpngdU3qMcfv+k9huVZ3e9YNLomZbiHlYFkv5VNp7tWueKRY6qAv3/LHwRnJerYUyaJny42VlQQImoNNq7USfkK01yXUG5VMxSUb02JI1DYef5Q5nJy2G8he0BigprFvTcqMcRDipwpv/kxXmp/85nUqvMSUWJbAac3ce9SSVvT4JDwgqq6/WE0iMFX2GhhLYU1xndPfA+wdnIB0t9PFT4TA6nk6084w6C9d6IyqAx9hHrJYlSt6MWMNYZtTSkrBpyfNRZIqb</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &DetailTaxFieldsBase;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2CXv3vMLpajZp9RsH56DUGa/k0XFjQq1ALZGxUpr48gy9Znaa+8/UKIgScvEUT8ToXoNqtJycRRyn7T9AVpvzrxVrG/hAhMy/V1pPnh0dATxg==</Encrypted>]]>&DetailTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YeF/YCKyZnzF0P4nZ2ZuaTRatdcGee1giZMhRygKA3r4PP86IS5GDO0FW6oyMqJHFVofHmCy6BGgrPOZd0a+hDgWhph/jzRR/LRWKd9E3YeY+x+Tla8Vlj4IEgkW9ZCYLuh4SklIju/edcz11pbwjS30JRgDtLIqBIrX6smsgI1DBgt0+xIhJ2pEmoI59R+JHpY7n5f+yft0K8/hmPy190=</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QTC1B19KETwYmMtYmUOFIrELrclecqdAfyDNsLoqJpNPrFlx8TeYY+81L4A5D53LNlTF9u1je5u/5M8PJ+rusD+DHBXIlDHooBbPdzJiT4aXG5qK1QotDGufznG64yhoA==</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>