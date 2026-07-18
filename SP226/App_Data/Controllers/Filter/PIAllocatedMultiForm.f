<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PIAllocatedMultiForm">
  <!ENTITY ParentController "PITran">
  <!ENTITY GridController "PIAllocatedMultiGrid">

  <!ENTITY % FlowMultiVoucher SYSTEM "..\Include\FlowMultiVoucher.ent">
  %FlowMultiVoucher;

  <!ENTITY FlowMultiGeneralTable "c93$000000">

  <!ENTITY OtherCopyField " nhieu_dvt, he_so, gia_nt, stt_rec_nc, stt_rec0nc">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhu cầu" e="Requisition"></title>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a0RigBl0C6zqtZ04HP3YHWVvPlgHiRhpaeMH1Dt0Vpz</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l179q1cgDq8xTa54m+HJi1q87orakNCgQnkLPBYzsCV6IqSLBZ3SZwdNTUGMk43ChnGFmNXFFf69kx4Yb3pbx9wN0Ej4tTWS5P4r8pOhornnEEeUK5Cypdzh4qgVmL7CuYx7hMslEq0arXy6y08sCUstZqvx4qQ1ZXGcV7C+tISTK971MpoIXG8iWZb3bVNxFW8jUoJ2OTsvpyATT048ZGQF0CFOx3B5w1SPMvwnS1LFcoRSLRmynMDD/JFQTYMbFY2LkvXYLqGgLzhAGOAbpvBNVLyNPjz8g1Guc04EsE1adNke8ejRMKnEy/fkPHM9EVVx60RH6mXQO6BsmGIA8A+4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&PEM9e2ZXdOX2DI5v4UQSsFWuTuHxbEbqNpCDJEWeDRGWUUwfQAqQNA1N+PsvC/B0</Encrypted>]]>&ParentController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&GridController;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHR16gqkpODSv9SvHrPF4ns=</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162rEIYHgRJ9xDjijbAxIwczP3dSOCWpMHskyM1G+9nZ8w==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l184uWLEtfXILCv65ewitlnkOYkNNwFyikAKoFFK3aFTrr4ijHJ7xGudd89YQprswnA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJc+2vspgv22jsbMS6SXq/qfk20Jr4MNu7Y0F8zDiMz1NocMFcXY1IJ8OEDIjtvIHf2hypyzd7uLIcRM5odCRQeQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l18QIsAL709MCGYeKBNi1dT4Vd3Gw1AJXSj11pMCZ4T/6aVRs1T5nj8lV2f6SOJPW+uvk9P7RP1hsIZ4PkXdLPHklgmPuOqZgj2tFs89ZBDkv</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKSxim174YwnfJn5ym/0eVzdalH1Q+gt9JPL5U7hfnFsBs=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUaZS0pZo/V9nf124psIn/iiRaCqDhkvzesdFIckdxbWyt4TOWdL869qz9mdNUYupgnDlcndT/Vg/dO/UrMql2hDePRN9CRv7jTHcx1+Qeshkq4V1B/5D4I1ysX4iar8vn3MaZW3sk5SEn7Rv6KfHysxX8HwvVG56o9U905Cz6IneBVQsW8Cja0OhiUtVJEVNDyT1gRjZRkEQ+GaVj6Re9KI5y5DqCd8YxQ/ZwcxSbKBgfvgfAbF7bsihvj+xFWDkInT9xGT1Co3yHBPZtIfCoLc3CNNR+lLyFDL1U2K6IM8VSz5HdpksRkIeSU0U5Lg8gokd2/NDd3XMsrRa/VjjFIl5mZB+HkjXQfIYqogPrjPLwz2YafN7B+gPSRW2P8+GZnTc5loSQGfWaPZBsWsOkl9GckQK44Qnw64MhiEg6qyYTLCGhgFGXm3IBAk6ZjQb3ap0R9j0MLS6sdTwZPrT5va+8minvYqVrgoTq+XodQFeU9B4hUx3DqhXZyB2RUjKF6BcBgbjkUUTl6kJ7a5rLQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHinYH2n8J5/eDxdw4/+XuHC/BMNZQZSSNmFqisCUOntLY4GhsoYk1PiCqsqnnOwjTubCNwaKxujhfh0DBgWUVag0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L2oFGnPU08jtmW8R2+RiHil2VnFN6VN1gGwLULTwaz+BG0JwMmK9s6Zrw6gAsBfCcZdxqaC6hrkUxTutUawYBvxdx4Owv2npWHfRVaCjRyWFeIhfEPI/HYYAj4rwamdgI4evuY3F98IHrWQkqAsNX6rA/EIbmjTpjUPmwZGym9XypJTzR2lSjYnbiZD06/fxZ5Sock7y+E92+Oznkur11pdE8VV1vYYBKkA+FWwjp3F5FYv8rbkrv9PYMITPiKq3O9RTVmp/60XqiW2tOIWVGSOTXD3PdNvu4T+3njLCWK+fDqz4EuXMTlMAlzjWntNExkiUNthc6NzioID87lKTz4Eu6RSlboOwIKq9+F9AfRZlriyMrKXbOER0AHgv0c2HBde5fW+spCXY3hZPFS7akUpha4+UIFkALQE7Uy/ostK1GOh77gMt56XunwYkIlO0JrfsRPhj3pLY2Wjx4OkB+AcyvGFxf3/ZzwsHiXacq5Q575/Nv8/6RAfn5CGAjXECoVNFDoND9IAWKN5+r6XdXKEFqBpXss+vCZdYEqQGXBwS/tV7bcwEqglMjiNKGOywOuUL7rsGTjvia2WOQ1vxHvK7ydssy12vx7+nG7wgUTmLHAsa/9bcI+FiHIp55TsuW5DPg6bcRHlA2uERUeRcRkLEiKbAMKzcHSN99QKc3R8Y9fi/kSJX+qov4WiE/k1Bei+d4SX05E2nxwCXwPpdkN6n9r1I8HHYpAXKdizlC1k9Lh73dhqVurHZ0sL3SSLZd5SoH0KNsHsq28wKaMeTDo6WF2KeahoziHF36djXeTRl8Z3APTCw1Bzxvr6XCS2k4JxYaBfJQMzjRWA5k+gpxx65f3330RYQJGmqnlxchtJKZRaj3EIbe9S5vQp8Eatp6KHD+RutaYkZq1cyO5iyDqPHt47TWdWj2TzbKCDr/a69wibLI4JApGoGtzCXL7UgAA==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOtherField">
      <text>
        &FlowMultiTagRowRequest;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8VjMu7lHXckH704wlcTJjagIjy4x2NShOkKiKF2UnW1ChfRQpqm0eAXzN8rhMbAwJtTWAKemGrKXY5OtO7fUybU/U+GvCNKu5ZGUjMj0sAYdznY83fmWD9mmSvnT/qrJhIHht8w8oHuhOlYjass/rLNn9OKgxTFczAKjjpwAAaQjFd/3JhRmxt4KLF0R6kggcOFqW1fTqyRL+fPOi8HdiFziJM4QnVsioxCnniceZd2aoIi6uebhIeZdcRkWeu18R3eBQnYI42mqh4UZiCpDdqr0juSvSiZ0xWL3vf9Ps9HiB+zOa9Vjc3bwYhfnhZC/+C/D9O23czRK77HgfoSzF7pvA/+mmf7pnN7UzwR0ZvOPHsLCL8EAR6NsiPjU0IWFOkhv7eY3lMumRwQEiiK7xdDHKWZR1/5WG0sPpRc9wtXJ64bRU1GO8PzkbDUe87z/BINujxAMVzbZ2UoZKSwsg98LtOlS8cWx0D91AGSMwCzb0bmPz4enfrwuAH15rLTD/MGcqE/DYs8gLMDSrjI7aT9j2phgdKjoD3sF4TQgtWf</Encrypted>]]>&OtherCopyField;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5O6YsqyuW3+8fKe7T11WAzVffICodU3noOOQEtmk1fqi</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>