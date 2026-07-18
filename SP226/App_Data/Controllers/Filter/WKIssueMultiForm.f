<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "WKIssueMultiForm">
  <!ENTITY ParentController "WKTran">
  <!ENTITY GridController "WKIssueMultiGrid">
  <!ENTITY Tag "">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;
  <!ENTITY FlowMultiGeneralTable "c66$000000">
  <!ENTITY FlowMultiDetailTable "d66$000000">

  <!ENTITY OtherCopyField "he_so,gia_nt,gia,ma_nt,tk_vt,tk_gv,tk_tl,nhieu_dvt,ma_lo,lo_yn,ma_vi_tri,vi_tri_yn,stt_rec_dh,stt_rec0dh &FlowMultiUserDefinedFieldsCopy;">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu xuất" e="Select Pick List"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFWyxKzhwpAf6NYictiCq+xCt+prYfwyoRTX9oxHq+9yROcMcwfWmSkPNcu7LctJ5Q48HVpkoo4WNLu15UkAB5Li5PQewQveOppeUHhKxZ5HjH0w7bm3Kbelmoo4tpf3jDSLKt14EAlUrtgmiNh9RSc7Q=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvwQ2yCAejk5XpcyFAnp2c1i/1Zz8V0ne86tlwgVf1bVceGVZ4hC1gccswAHIz78ZjMMTauF1s3nkZU9H09ve24GFVQmkqhZytOZu2nxnFAfZLDUQEoipBnNv8XhJkk9+FQDfRvTQF53lc/VOYNz2bz8igCHyeU7yWgCZg4YU9T5ZfmAj5zjlFXAgb63fIXLCn7tj95peJ212L4fDUTTOI0QKoxYJy2F3Ym3qpZp84VILgto7tni1SmquRGez35GD9SzawJ+UO+vcS3NOcCslZ354SwuO1bYVoXbW3kSqzl0rutafHMvMKnNWvV39X6dtPeyDorboqM9EfAsnL+aIKHHmBQ0AdQm+OFZK1795k2RyedS8zm65bN240YvHmuzza+CGmTKctsQs04l2WzMCW4LAlE2hqe6tT4pOA/8OZo3oA==</Encrypted>]]>&FlowMultiUserDefinedFieldsCopy;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6Ejl8zko9cbe/JXzZ8GKMzy3y+w00rn5kwXGvDuh2H8vpsuARaj5VMSVwiD5+hIBYWMDk4liLy7zTJMeyfSDC+fKKJVIGYXgYbtsz26adg3GrUAqqHN2paRIZ+dvXFlt7ouFzPCA/MrXQBtUopPFNkhUTmUP/tzf6kaRxwoHaXDjwe5IshN2cpSoK86n9nCUnrUXHA6XV7E7BLKrG4RY9v9U36WroiCPrtxdejryS/nTLy/LhVor9zpIuXTDGT8C4aaNA8f6RQ6ffqFPGRBoVTk8YLqc4h6mbWKpz7nUV9daKcS2QHKpU3FKyUDxXT35iGPLvbIK2cXI4MMLJxaSoHYVa/+IUgPUpfN7RBHgk0VJL3WH0tD/5E4ZreqEr3BAy/bCZbRXGzhyxFhg1fpddSscd7TZlYyFe1o6pdNzGD0ngD9XekUF1fNfqUwS4brCMJJe2XvIIMfxEHIE4JqGhKrTBPPf7tppcyaWF7B6k2erV75MdcZTXxWpUCAyAFPLnWFvrjZsAsg1q+hRV/03GcEdqFAix+HVmUVbSDmEgL26VNJaI7tbBmFN/rq6y2VVqO6m8ECu+T1+FrUoHFNUsYgKXqqK+WjzR0yn06Qs/G1tDpRbO7HyT7pJct4KMH5wilChwZTICmotFCmUMhyGfE5SeezVj6YjvU0lyAzdhOjx</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1RyD7txBWX5CJQkA1vnzVXDX2CbsrNwQhjEt+kAQhY+rlxHkMEQ3nsImIYdencNWCxj0fx5qb//1z3j9w/PjxwhHSSh5BxghWXAbkoR0QbHcAMcS8oHfLWdIDzfgHpTMkoHOb65kqNztAtKtzyElIJgl4Bl71nN523toyrKg4QjGT91YkmxbvjSc/FRR/un13PIjW4aKQiBDEgOO+i6vuCQ==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLscCWbRcZdE1iJmWgnEI5UsZhC1ZcdjGKc7YuBpcl36CeOXdAKLNVRo/PW7e2iKas45cBsOz36xT5UCSEhZzpYR2eNqsA9/7dIB6rfZsoC8KUqRL5LoH3jOMfDWo2bkYoHUogVxUNbsfB+5exgEfgheL7bN02Mreocgl7yGxDeobjrfoqML0oF5XYWaQiTk6skK5XjRXvx6Np9eBC874S2RQLtAYP2swJpW9kDzdCe3m53euvgAo8f/tf2URDxQRCnEHFhB/NeG3DJ3t7/CvB/XoU2JVuxQF7oUOgnZCXUCC0fswMHDLJ6abDwV6rF8ahbrAyq33e+7HNOTxLglZtet708PZyfXRg+nj/MH/Hny8xFKQheX1b4UOBWPC5wnng==</Encrypted>]]>&FlowMultiUserDefinedFieldsQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ecplkc91Sh+IWnf7Pu33VflN+njen7gTcAq2hnHOS5O/SvoomGATU2ZA3FhrHrIrMA0hFf1ZZxG2K940f0lP2AFKMZK69s1cbGlzQ8gSvfAfkcifyZqEDq26oX0oEPCZRhvSH50twBMvNdfaKIy1ORo63nCUZ6wZivVZxAJtGRd7AEuYv9QAxlEvyXqLPp9MsrjgtsoV30DdrugJCqA1oa/3kRT+YdyVSRQIbP/SdAoMw5UW2zfH30nhZTzhUOS/+ZDIirJepPgKAnEbMbhlHEUdwNwof1qLqIJY6RH/q3p0x+5kdDS5alKnesyfOi/gxMc6BPvHn/SCGr0bn4MjgoDJHPjX73n2PrTFpRnET0qzPzkOpUWjRnXKYdbAsqy4Q==</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>