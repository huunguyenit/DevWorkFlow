<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "SVOrderMultiForm">
  <!ENTITY ParentController "SVTran">
  <!ENTITY GridController "SVOrderMultiGrid">
  <!ENTITY Tag "">
  <!ENTITY EnvironmentTaxType "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c64$000000">

  <!ENTITY % FlowMultiDetailTax SYSTEM "..\Include\FlowMultiDetailTax.ent">
  %FlowMultiDetailTax;

  <!ENTITY % FlowMultiEnvironmentTax SYSTEM "..\Include\FlowMultiEnvironmentTax.ent">
  %FlowMultiEnvironmentTax;

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, sua_tk_vt, gia_ton, gia_ban_nt, ck_nt, tk_dt, kieu_dt, tk_ck, kieu_ck, tk_vt, tk_gv, kieu_gv, ton13 &FlowMultiUserDefinedFieldsCopy; &DetailTaxCopyFieldsBase; &EnvironmentTaxCopyFields;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn đơn hàng" e="Select Sales Order"></title>

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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BXvd8rc/406evJncGMTPQTsXrBsMujvvXdkk17/Xn0U17qco29dH8ij5BXlRtOZZ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFxAZzBvBabs+abMCmRAI0686uk83inQerTBvb5auiHjegfp162x+WX8jmH8m72fftG4d5K27CA/8jCfgVaV2tbemjKIy0wIi5kO98Vo1IfYQTbX13sDRJ5lR/9sX4+tpPJTc1IXzOk+kZOl9anQ0N6bchFtAmbxwkmrY335yl4+QoHz19E9a5Tf5DWoWYa4ACOZsMBPWWihlcohPcHvUALHu4YI0iYO0LREsHh1HGmrOsivp99jwRLv3XOkjr2FzFwBsAn9y6PKRsbpvz3AzBHU4jfucwoUDpn/oWc1GLkMB+nQemN1eOGa8BYBwAf8F+AL8CcM3V9jDZcFrgJ02b7/2QtTr3baQEden0LtaCg3rzO/fD1uGgntJETjBhrSlu8RhV5LZeLkDCGJ1jIN3zmNjnG9WR92hkB2WmrfCqz60onFMR1PS2dCMEWIbbAo7jesr2Tq8whxZZndnVDLyw7USXQhRKciJXtQtVmDAGc/0hFSix+dj3/NxFt1nuMw6/w3HXnU5cmAI42sEnQjFZ3IYNMUv0FWhnrgBYTgJhh4fixSMULbrAmDthfmjyPELlKv5l+V//e4nwFJJzL3F4DOkNZbNKj766A4qmqvMQBkzaZ/ZBmQXe9nphxKElIcm3Mj+EiMW4iUfgnIr9F2NP84vIjIlUIEdWsBJo93idjBsk7yj4gGG47EOtD+nta9sGuprZ8otA8iaEjv9vizViHMr/xKDCJXvegJGNi1MR8ZNT6RKTFXRDD2jd4qUexjsyg5igVa39rq5G19mCeR09mH</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy; &DetailTaxCopyFieldsBase; &EnvironmentTaxCopyFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6GwzlPkFqXnzJ344yeEfBbSncyJqWPbSNmzMdznQYCL2rTFB6gOhHEEt1oGQi1fvrEyv21ImX+VFsHMHrpjPXFtXHyVoov2QszIjnfd2LWMZS7wgfKmJTCuJU6bdVbmkI3BaZ3t/Ah18p1zQIqSFPe1IxxIzsg8B6zl5baC5IuPuGyFc7ugp0QWSk/KarfaFgAlCLYThTSTYk132tGtLLiz++tPA6+TqEpmN7t1UBEfY38hCz2wcYBAPPQiTMNEn7zTChAXpKbLGM+Gtzq/YLaaeeaTW9m9g8slV88YOseyy7il2/FfJ3wjfeBRfCTEo0vobQ6OAdMn9g+m/puCzzvbvDfrdMS9GxVR5lRj1CI/jdexQCx6xJhPblGCnh4nmVrIn98BH81VIMawYh0Da9us1gabRwhjLngF0NRX5FooIKae5nXJls/giLMfI+qqWg6NK9fJpG2njF0Gaf62/mvpTTt7p4NbzUtP2ZPUuOSPUP+JkEgYn+4ffr/QrfS44spfAmgNyF+Nh3aCu3bHQaivKDtPJkoj8D+KcDiAk18yL</Encrypted>]]>&DetailTaxValidDetail;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyQjyRU4Hxqzw6NEUu/5gZl3dzHuu2i2tefGsryyfw66OVmOurou7AwIV1Jtp3UBde+GZwJSVzBq7TQJ4GXJztJrMIc71vIg8Epaflb5VyTpW</Encrypted>]]>&DetailTaxValidDetail;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFySy9zOvTDU9YtTsBWon4kj9OlQ8lBUYU/I6ueuSCT3ctSGyGS7t8HV+ZEoJ7eXQqHg==</Encrypted>]]>&EnvironmentTaxValidDetail;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyQ3SEv+bD2ukcz2HNUGOil6tmpABAl3le3n1Vk0skfSfR9c0u7WSrJ6q7n/FcmThi7/UVtPsUNZXmGCFBsGxwFSM2DvBOirOFKdypmP/9eqsY6t9haf8B11zYSvkhzY9OdeWZFkFC2EUtYcJOaryWv/iL+oI2A5W2pKhnQDY2yvVejUwGfbOQssShrr/ymAqp7TsfNGDMxyInGOjpMLgzE+9txm3cTX+sbYtQlOk/NGBeKCzdOJJ+uYpDTTpYbrlTPp8WvbNilWm2O0j7jNwUuMmR77DqnHDv44ndFKCOAcoKPkPBKOmObtM/F8fBg+fTimA/+0a2ICJGsg+2slRmE40nUtleF8vrmBa9H1EwNGzOLtyrQ/qJfUR0viBu/LfOsZ59QG3u13TuFl6aAEnzFtcIfDqPraaRXzg74gSEoVrt5Qxwehiww3Zqf7ZGPX2dNwV6VUAvMAWbVhgbdvd8HBH/F5rdpTvhMyM+bqmRwu3g7KGZ7nImP/G+eUOOw2GNpyQh2JcPoPfd/EULI7Y7K7N/Mq+oRsQXMiOYJf3Uy1BHdBkH68Dv2uscTTci8UNhMI6AMuwe572BGQ99SS78ah9svP+l3UMNc3jEYZU00UU</Encrypted>]]>&EnvironmentTaxValidTotal;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFycByGlvAdtpFKvptX3ZQboCOmEYthtfGe9EisYM+N1Sav2kCnDMKAIo5J05QcB3TzLiXs7nPYgMtT33PAY2LKxxa6TSjEI27VCD6y5F+SN20wUwIKvxJ2Bx+HUM8xj0VNrTIViUvUME5pcE60Htcb5lj5MmCl8A2H0uln4U7H3IM</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;
        &EnvironmentTaxDeclare;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xVo2znPMNWd/vImr/fz/sYG2YF5D2bdQp9JJeMpmjqscXipqnIRLnfwXwL3v9Up8/ER+2QQEWs7gZROSkrYApaiKHo0SvGm+ywjer6Wf+06/qQZruLD4iFXC2jHi3d9dDSsNN74/DL/C7+suWKezHrI=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &DetailTaxFieldsBase; &EnvironmentTaxFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGBj5eHrYxXVQm9mkqJRaGwcM9KdCn+cNVcI4AZhGGYak=</Encrypted>]]>&DetailTaxJoin; &EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VO9NrLQLyO2B3vPMjlI5H82zyb/dXUtj41BpYKSXgzoDaP4ycE1zOLkBMRiHGnipcYmP84rSuJmva9AZPORx3ckogoJmRFCBR6DpngdU3qMcfv+k9huVZ3e9YNLomZbiHlYFkv5VNp7tWueKRY6qAv3/LHwRnJerYUyaJny42VlQQImoNNq7USfkK01yXUG5VMxSUb02JI1DYef5Q5nJy2G8he0BigprFvTcqMcRDipTTcAA2ClYf128VoIq4KztubME4Ex8deECz9VtOmcMTmX5Ce1o1LLI4mB/aK50V+KtHIyB4A5+skAsRm+wcq/GLU8K0TmbAj4Cx2CuueRAtgqftNMfb0GAzrPbhstAeK3tqtgSO++FQiTlFOAi8jZ+fSxGiQR5pCunS0lL7T9QfCQihSmF3t8pL+C6dgnAdz1</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery; &DetailTaxFieldsBase; &EnvironmentTaxFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2AKPq/I7XczxxmyFFG0AQfQ9tvL2LWqJjKdQ+JZOGCIXcBdzTfSE7nlgUEFyoj2w0LsVc5z9+y/a9MUsUdecRuZioY0UHZ3uXekrWCuoU6Zsw==</Encrypted>]]>&DetailTaxJoin; &EnvironmentTaxJoin;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YeF/YCKyZnzF0P4nZ2ZuaTRatdcGee1giZMhRygKA3r4PP86IS5GDO0FW6oyMqJHFVofHmCy6BGgrPOZd0a+hDgWhph/jzRR/LRWKd9E3YeY+x+Tla8Vlj4IEgkW9ZCYLuh4SklIju/edcz11pbwjS30JRgDtLIqBIrX6smsgI1DBgt0+xIhJ2pEmoI59R+JHpY7n5f+yft0K8/hmPy190=</Encrypted>]]>&EnvironmentTaxQuery; &FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3DGXHfkyQUuOQk79DyG3Rjx4EkDSbfvjQRj7GFsPC6R4tfwpVLYUXspr+S6gsVMfDJzSObgmVmZ+QUEQkKmk4FvoymKfZUllkcXYGDaNsBLpQma4x+JFSJ7hBqBNm4GVA==</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>