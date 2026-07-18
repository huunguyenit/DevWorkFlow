<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "WIMRMultiForm">
  <!ENTITY ParentController "WITran">
  <!ENTITY GridController "WIMRMultiGrid">
  <!ENTITY Tag "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c87$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ton13, ma_kho, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, tk_vt &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu yêu cầu lĩnh vật tư" e="Select Material Requisition"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFzQG4QYhHhPMT1uUC6kWm226+h3vQOzxggAPGu72nTa0g8DJPpDgEmISLl+i3pNgrGxdXmiP99062Ljbmkq5fPcNJRf5tQhM/HhqbVYclAx442cVRLWECC+o7VF9obS5WT8hwTqJUdGTcwl5I3R/vSQFMZ841R18nVPr1uBXLhpOYvatZi/MgGYpRt0TqT6utk+XFSZH85CnIAtj4xtjOmDwEBSSWx4LhOrAS6K5b5woLZb660DSDlPbgkpk+R79CRchC34ZtuuM2Ij+VrwgrM6iaTdFRHmX1nW/Wf5k6lp2fq9Qy6kP8bONPoX1BbtY+M=</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLow9mc0jna84x7yDaahoM+o03ETc9aXo8nfUy0xkwTmXFOzeBT7+HzlJytADRQsOx7SWAcWU1ciLr5NsxzcS6/5zRkqlhiRd0AxPMvRiZw/yM8Ou8b6POs64xF8WkWm5EpTWFnUrYdVyrvw+tClUd668u6GWTHREaDK+2xtXw39q+SuhcTcpvRU2MAoPwbuAiOGaPvvOE3ef1cChzATiz7QbE+2hZPGNT/wute6SVogyDGSxQS6oGE/LNAlWdPl66JIhl1InGbklzyncEZucKcfeZGkOKmUqJXTlSU3T9Cej3phWioUXT7XSZXXaQ5wFsEODSCYcuRUX6/hEmQI/gcOtZpSGUZ689yoSxb97za+GLMaQyQPfF9Cc4+NMNcYAkz7/l+p7W++gUv1nr3fGmrroQ8mKezGhBjcGBwMAdE5D4tN3G/j8lctNtCv5eqlyo30YQ0HyN0lxTWN5W7xhg0/UDSZl2kWMlpRD26R1ritdkXdLLfbjn39INlNhuFNVaLX5F1qryizGIveGAJYAGjURqN0U4xGABImJ/xwX0AUfmdsEx7FMCdbCHC6CpsJrI08XZpHmrP5c0UgsAdybt6m67+hKBn/Brv9rwmcgviLhJZVgM/tEqdGpEypJiLAnkboyWc0qljQmTiFfTuXN9hH02EXXkI4Hq4RSqYVyUsX5VgL8xLIacSa2nRHrNbNWtgtrY/vfdNkJnO0U39vlJ31D6l4FOwudj0SeUo5wOaorsgfigKwgkbUmSb7OLwhm3WyCA4JRJO2a3klcxwGzFMh/u2J2/XmcibkH4zKXxU0PJc77NgGRca2oTYgzM5veQqzEHwzd1AveSNCq4SBCj01v0ePdjAOgWL296KbLEveYc2hirB23uClVinmFSk2Kmxf+mOOpX7XR7dKwdp4IsIc331w1ME1BkZNJKZ3CImnTOq+7ZUPR7wlfNiuRFn4Vn0eoLcVkEL80Gxm2F5TwALui2LevtIjz4jv84We4X2npUhYKnTIahNGMBYZ3U5gQ5gW3Wsk9zUB1lQkh+FDwYNhuz9huO48+KU4MzJ9s6Q/nOcIw23K5cyaemZrA5lEBerss6UhAEVwZXNSPHnBeoG7</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xa8IWiBR5jJQ6f0MLq7SvdD2eygM8ZtKOd8UxQx+HtFtah7seIxdhMbdyu+7fUSx/Ko0dmVBDfk1cogYQREZolA=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKG31sJKG2gEOWj4TmpQe4DO+rfFBELgk66aSPOs6IrIHN5csZwFFjuoMnEvvlfx8BVt06h+7r3BeNfIjdTbheOno4iQGvW6UToS5yJ8DFE+upetRKnpv+f+Jo3kFM6j9LDjVRFhQ8fMu3KNsP+anRwUve3/NstbzKEtcHM1OXDCmz0HByh7f8+bwN/dUiuZKOzXgPvhAf8lfvztd6ZNLFXaeSTdUO+qRxcN09lsOogJ7AZv9M/82HFC/RC1dak8eOnsDxd06OWkt02nsj/sUr9Yv5r8Ghw244iSW6yyVKXoprHsY4E7p7I6Ga1b+cdjChD</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2DGJfGPGEDZP8+Mri/Supva8Ff/BPaX93DhzKi3eThYK807qWE95c77mrgNZPVfueOUClfC0vFlvpat1WCUH9qF+vZ9wpB2rdg5HZEuGs9TWartsgn9y7vYH/NaJK2BBRLzRe7B5epCOOkJhyEXaqXEfpZf7efE5EmoqB2UPfd31v4QgVmvCZ5DUy6Cq9S9L5AEeNLwr+3m8m8kdwkcyGkHAt3098MzU5ZOKc4HSRQUH9z+BLqD2l/YihGkReUvc5Y=</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8JQoPadc4xmj0KPgtk5CAeVtE1CBt3r5qq3lW4/aM24b6GpzgMadURHKCzvQ0dY50ZbaCFsx3zwLT7qqixdJhtd2L3yx4+Ovra8naqdLay+kGo5BjiN/ghKQXiYXGfHlTUUTrtDRK6MRc0Co+YLmqZiaIxn0udD3sqr7SlRF9wSYsC8Vp97OqDDUFyRKaGIlc5mOmVa9hEgm/VWGG0fYgPHE4M70fUgZam9aCYfGqPVlkMt4hDzH1PZ+W/d/1VpXH6wEYNM53Qvt4Y7L6qgpb4=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>