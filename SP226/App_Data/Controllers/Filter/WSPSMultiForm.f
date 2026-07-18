<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "WSPSMultiForm">
  <!ENTITY ParentController "WSTran">
  <!ENTITY GridController "WSPSMultiGrid">
  <!ENTITY Tag "2">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c86$000000">

  <!ENTITY OtherCopyField "nhieu_dvt, he_so, ton13, ma_kho, ma_vi_tri, vi_tri_yn, ma_lo, lo_yn, tk_vt &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu phiếu xuất trả lại nhà cung cấp" e="Select Return to Supplier Invoice"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFnZKNtJMLYXXGCn2I7dK5pSfoMbBMLmJBb0LGYB1EXFx96gN1ufXy35dcWeVRVBGvyCg93X83Xd9Ks4gwG+qTUGGHfPzbs3cHag2DKv4Z9BVd2ms6mlQQvPSDAM/MaNE0fLQhpJMhwet/Ypv0Y6lL3aHPSNMJ6aPsuQEU2FrgfBdAszofsX9rRVe1/KJyh3y5tB1H76Re2XHXmaJ3FtgoclxLoEbj0vk6D6TPiZJUAyEl6DXgO0lwXs2CC/nFu6QAHs3M2eNb3iuPJsOtqd87dSxqOPnibd5cFMLZiEN/LLj/NeUqZA78Ke/rN3L/JkOiMIewTLjIh4/T1gg6EcLvFWRaz438D1qxhuEJ8Jin93koABGQTG5ANZ6Je8pRb25y</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&3t3N/5ofOgok900XO0gvbFMUNZUTcT+XfC+WH+fzJLohCMBuKhzHFSFBoVfopCc4jdTTzMAQqYnf9Kxt6cSt/6CrYj5zJAZ6AmH5htYKPKcHmituHhP7CQzi4xY0Iab+drCr/YxB6H+inW75ZFYH0SHMHcDvApkv8fzBYl/NCK750TXhLXNzHaXIewzA5AKxaTYE1GR/FoT4HxykRxCi3bxOv44CcDpmG8KPC5dPq3J/nXm9qsFNVYzOFjDKUxVS2jGYB6md4zJrRLf+uZTSiZhBAyUnSkZRjKi4RwDk304bXcbuYYMLP4P5gQFb0gQLUILCGVYPFGgwHlKves7+loPTliziuLRwCmlsbDK9bOAGJCsu8p3hx8TPol6AzRTLzHGuT+ZyFH9TJ5wLSIgdSKmjdGZAO3nb7EjD/UA26vsA4hcRbWzRXzlPetXx7bEtNfxJdqjk9xQncZ5CdBb9A4ufa1k+D3+Fi2Xu+lG2owQkDZpAiE1nxP9G4piMzmoDoBYguxpWRqZ35BYPD29HW4rvL8fO8sZrp95iyqoyfnmWIn5/0VeVFT1ige80jRrZGtLaUohK0ADvTeUULzkpD+TnJoStQT2Mdut7XlOI/LTYoQZeO/HtM3ra1vZw+SrpIuP7uXU302TCscwa2BesxYzCSlnJ6KL0Lp/3X9f7lFlupRajUkXis2CmeApqe5aXQWZBKCyvpTo439BduXVt+8SDTLMJfqyhM4/mgM8aY6yFM4hMMRAwtqxk+pvEhAhPqAPCCeTXb2bl9/00PQzEuPG3Q3FSXCYnIyUgdjDB04STerrSjZOiCiInabXqmmc7e7vMrbQWBpa7RPiNaM3eACF166txcha1vW7Wj/N4VRcw2v6dX2KrzL2mQcIkrGuk9S3ZqJGVakUg7gIInuYoqsRStUjUN1gAonXV1cYMS1XhTWyYDB62dn9EC+BEk/SDlc2e1+TsyXmg7TW7Zht9HkWcjbiuY8OyeYsIyK1M1O+3VRrILbC6LaC19FKkSSV1Wdtoj92OjO7lLyqkSK9QsxcBUBrU6M1ROnOuMczpnZN38BrfNm6w64zR2p9sW8kfvjIl6DnkXl4zg7zrpr8O62QlmMdo9Pn9KnaHHsGn1rofRHnHHdHMRmVzSVt6YqkXhzBVoCmUMVjOUUuuAXzE/7zJ0dpPQDQrN8pHvzm14BPiUL972OQzz4MbM5784GmtQ0/GX0KeIYSCCqf+jtxKCa9EhlVhZS96OrlJ/O5fcUL4wt/WffnCb45R3DdVB2Q1RxvjqYILdH6p38jsssznXwG313g33w+4rM2loY/WCfE=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYmmKfLlyVF1OclKYdSP9X2hT1TEEk47kxtOOqvaIHGKl/aAZ9KXeiYUbNj02PhRkUYm3YPFVHgBMMSuiWLvH6xa8IWiBR5jJQ6f0MLq7SvdD2eygM8ZtKOd8UxQx+HtFtah7seIxdhMbdyu+7fUSx/Ko0dmVBDfk1cogYQREZolA=</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zpz4Zm5W3lY4/+BYwYIMFlND05hEPGzPX1hc+k2zMKGrYZ8H1w2mOrSaKrCm6z4hDtJS7sXhIZV2jH/4wCgoL4rnwuS31W9sFa6j0gDIprdAc3hawk5hS+yzhUYVrSz6pIK/DPvJfgT+JKcA70ISdRndI1MxskK98lrlJQIUb0FSCm42iU35jeUT+ZFwlJdumQLaOTckt5DRzrNWQnvuWdIYAV2u39BWfr2soAx2j+NJHYIerN1iMV/fAIZl5QNRHHVVWqcDVjendk9IPCkPfUBKPDeqcrKh7XNzb4tnKz3bwPTWG7TQ5ufEuuHYLwfjdWneqbLprUswyxUgLWLJmaTMJXiv9KMplmCm8zeTno6</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2DTDRd4aqLlxsGSKtMs6IYI04irQwpL5IvQANgGlKbOye2IcaZvJEBp56agJ+bIpgs7proZpFsitcJYpisOLTOUuYiugttHJdJixMqcyXIzLfwwfD+hFEsgbWHNlTeSWcahFSQSzFLK6eSAYDbUESWFNF3g/PwAB5Wv2Ha/Y7u9LrX9bxMR1UtsDuE1rmZ2BzQT6zLjWMBtZgxAJWGiT87i25QaPIsJwe5LWebbNLP73HWpi4QCiGUVkxH2wq6WY6o=</Encrypted>]]>&FlowMultiUpdateCurrentStock;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8JQoPadc4xmj0KPgtk5CAeVtE1CBt3r5qq3lW4/aM24b6GpzgMadURHKCzvQ0dY50ZbaCFsx3zwLT7qqixdJhtd2L3yx4+Ovra8naqdLay+kGo5BjiN/ghKQXiYXGfHlTUUTrtDRK6MRc0Co+YLmqZiaIxn0udD3sqr7SlRF9wSYsC8Vp97OqDDUFyRKaGIlc5mOmVa9hEgm/VWGG0fYgPHE4M70fUgZam9aCYfGqPVlkMt4hDzH1PZ+W/d/1VpXH6wEYNM53Qvt4Y7L6qgpb4=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>