<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">

  <!ENTITY Identity "CBRequest">
  <!ENTITY c11 "Ngày chứng từ từ">
  <!ENTITY c12 "Voucher Date from">
  <!ENTITY c21 "Số đề nghị">
  <!ENTITY c22 "Payment Request">
  <!ENTITY ext "57">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'CBRequestFilter', 'Filter', 'CBTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return">
]>

<dir table="m57$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn đề nghị thu tiền" e="Select Customer Payment Request"></title>
  <fields>
    &XMLFlowFilterFields;
  </fields>

  <views>
    &XMLFlowFilterViews;
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGC4wXbIV48PhkvsTtGPkVlij7kpDjHKz8xqvhz2dA3q</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nefBIr1BdWaeXowPXKgZP+aWfAoW+/JzITmgw11l+81e4DwCZRrnqC+KLfXHp89Vw==</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5W7o5umcKpiFri6ddCftH8T5jxob1TbrUExgCkPz7jhOa9U8vhhM4Qv40gtD0co/9+adqEkEer/k/oeGXHhITWUeFJKP356Io6BpweNHza2V2EBHgAeCZxKJH2FXbF06IgBZg+m7Q60h4SdfqZW3QonNA5ai5NYLloBtKOTdVhtgYcuo1V9tRcviRkBvMCnkFqzuDPUM77E3WZe1HDS3E9dJSwVXed3wkc7pB/j+hM8uipTOzqjDrmSiYVUOjkLEj24vbiBM17wC2UrKn/GLBpIv9ZDweXrDpBVBki0RiIIECjH9UpMVjgU9s4Z7XUq5A==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nefBIr1BdWaeXowPXKgZP+aWfAoW+/JzITmgw11l+81e4DwCZRrnqC+KLfXHp89Vw==</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nefBIr1BdWaeXowPXKgZP+aWfAoW+/JzITmgw11l+81e4DwCZRrnqC+KLfXHp89Vw==</Encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EQ2N6Acq3v5PF2jIYMiKIwrMqywQcOkVaRTB55l21+VBwkWuwkWJ6i9vpRCvwafRpNLRC5zxuG2KAwYO73DMA79cv7m1WMDDJ65ncmn5cC5cYqvGtw95+a6whzfh4FXSRMDSVZUkgWJK8KNQk4vv0QJ5QmZfhoTH04xmir6Tlnuff0f/Fvgz88Cpwx4g96mKDOEX8rOmR3rSeZ58ylCStOvB6QXzAuZSliQCHt3qYbbTPRqxX34puOvTePK6I5bE1GCrEWKYXOvMf+g8mIDe43A=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWKVGgbnW3GIrrFsajQ/n+EYQpoJVBtzgnAiPetExqsBl5tYKLqp2r3GkcNo8aTraNQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJcga5U0qJ53KLHq9qyQLk7xfjGlF8rLTvfZLrE56dnToHb8zQXfqC1u+vKc/Sb4EuLFyf+PXhLpEMXYcPPPjSQH1zR14UY0F1yjLzfjQYN8q15JDr7M/JI4TO/db4jxBgZSxpbHM3j13yCh03vVHjGEtuULoFHQFFGcdYrTJQbiBWyBYnUdTC3EkGyNKU6QYmyqSkAnDKjQ0fdNRt/xeax2ZgwmfRTEc/vvkeADmKXm3g==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3n7fMSXuy2bYhtxguM4Jm5kWeY6/iurjaNyV1uNgdYbtZwSFnqzz8dGMhV04oRPbCbF6yOneQi4uESf9zTxZSrk=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNPYFlJSA13tHsIE/Q6nVptg/BZPfqTnRrdAqWCr4NRkunOjY4/0qqFVEAlpXfYd7UrzOnO5GY4OuFVDtj2fK3RA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKS/QcbMrzDZcy91CV2WQ+9osWHzpziT7mdXsRP5+5V4FQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq7zdDIHNFn6Ro5j8ECt/ahr99pG7IUuOkGR9qMvzfy4skecorHnD/Ja0MP/97+ZitolYBy7JPh0staIMZYiYRuQ0MrqzhuKjcIUHrbw6cSCOa1wUDkf4erlYqHQKmfZnkU+tS4k+lgTs0ieazSWBRe404Y+XD06saAsUO/WsF+GspBpwHFxYBghlKCRtPeVvwA+ICO6K60aTy/1OEAKhpciP+pei1W00CqqoXfb2hM9bdSpfYJDVhLaK+4mjpM8AI88lBxDPhiYGPjBcN53on8IwZ/rzLlp4iXfgRPBDZJGqgTTBig88/7xtXtde123oZ7eDPY6gU7qCC75XZ9qIWEH3xIhSgaOYWRiJ7OBcUa5s=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUZDur2yjpupGXWdNRo/d9TxPrRLxy+5szlkx+WJjM8yCo2QzxwyXbbmDz16qNqrLCKUa2Gfj6P6tl/YzdWd09I6+4E/H4IUBwthMSKsqPMyxEkTG/fLiEOTf0zCvEBNoz1/CIU5EFU8nS+by2R1OLIxl/nFoPfeaCq2JfEFQZ4sHRIJUeWbU86nqvmkRgkd+gBY4+WsXp7FXuOxW+ztS1GUBak8t7o/zT6hD83Os2BysLmFU7LcS7c/GaTVyy5E52JDeMSjSqgbg5MFMtJ/3oq/6Ct2g2vYA64bbvBvdMZhTL8Xo/aC59NLPQheYS3BueGdsZsJ50JP7hVnQeZBcphC334eJODp1sv+3myFg+steOOf7cwHwetrAZjRbr5AA+yR6icvPSG9b9pSl0uzJVWnQYeMKlFH9Jt2OhUpDdogXEX5lq5cnW2GbiuCHkRQoK1I0gB3RyRnlKuXT8dJ/HtWka/WRnkFsBc3BBrosASqxp8Br9pk39jIRDcjHqrSr0YwvV6rXys7CQmAfgnpykABY3H5tce13JFrIsbshCaW9Y7NN8Iow7zIJubJ9eLO/rO9eR2zfZFdcWmSsDNryrF3OZQ0kpLFz+QyfU0iN2dIyjYbnoFmuizKImyL3DJRtEddT++oomlHcnxpGWayJDBWierlZRjjJDe7sztAkjdM=</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5e4LT/B3Kr/RGRU3/cW6avyMSEn/oH0N4yL3g+/3TtKckLZceW7MYlPXyibbPbluW0cuGdGJip0Jt+7mRpCmNDTlAtDg5gmBAnU6xiBbpXvhcVhD51XBN0EHJIGzZp/qLwNuh3i7LlfUUuy83woAw0PpPzgtHb88mxurrXjDQJwHirfb9AsceWbfYXKeT/pBhKWbPsMcKz21mc7DOjAmm6PanKnw1eJ6dR6d1/BxoPaiTwAs8ukf/Ed7Dyffaa3Ga5UHen4+0CS7XNOV92SOtxFU7dQ5Qy2ZpOgatBIzRCG8vA/pBnHT9oksg29wxjvezwKhMp7T9KQbVq4WvK6GY8EHPWh1DqIjtmYYexfQsHz7CcTbk1gh54FUb6/UDUxtIvVF6v1w6zi7xl6IaxK1AfGC3Tre2X1g5G0+VfBOd2vXhfQk0MHJG46pKP3glKSOV6NFKXXkBuv4y8c3EfSyaob9EcSFcE8nnXc1rJpd44aU3f1rrNTfwLAI5r5S7HfUtmwaCayYDcJ0EoOGcTjcVbBeLEUItMxC23IFan47CwY2k64HmZQ8TpsNcHQaSHVhTB8VWY6rsHsp5Av+qn9Y/+R7WgVUzSHkEp55gsccmi9a0cuFIsLqaqaYOq0YZvUYnFrnWIrzubjDTVHGy4IucHO8/srlzHp7MhGg68Qgw0yj</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="PaymentRequest">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+WzIv1LIniksQQUAPFwtU7/CF8RKdd2wq7nQS+uFJsPTgK9TeCwzxoNLydx+q4FAXKaaSfafsk+14b1QomaNEnxo4+XM+wQhFCimM0gj08o374LPLcW5fEXT4KBiz65MXFAYqC2n8UXEu3jZMg0JZeNTvWDuXh9CYK+7N1rjF4Rpodq8UV30NfGzYwpNO8k+lEfJWvUmzNblNfWKhlRHfH6iI7820Wj3j7akU0KDJs36bQXu2Er+OWUENAu9Rj61O5LTxRWmyr0FDXVChkyuWPGznoXN6+1H/3ipiaw0ps6+mdGtxB2H5IbsyX/cQ8wQDskjvHjDfSeMKGrvZf0sJ1SG6bxJebagNl64Xk1bFlgmJR/v0Qlhch+lmTYM/PETcDnve1cviKz+Jyjy4bcoXgC56IfmTBjqRBrSHbdypK9J2aMH4P4nck7cRQpOkl/3c97nkH6LGwuucwUj+Hfva/1d5rA277ejILmCs31SgQL</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VeBXrvz8mne6Qr8RsKX5kA3dxNChrsXq1oSK4co+WI6jNinasCYdGVtedCDJGzYIdCDZkMsNa0xEUWQLFwYE2UzeR6zEHPJpROoelEHwShyWoUo8ZItIYd8JMk4rv03h5ScmVw8jU3KrTzzMDXpKh8d7Oapx0zjozYSHzxzQfb7ypK8NLlQw41cGydrt7RBt2t3l1Y7VBrB/gZ7kM959638v54OJbxVEI8zotLT+Y+9e0YRQ6JYDFvDmwliiH8giT5qVd9IVYj+PWMMvsjoSRUkGaF4A3WNmY7X6Bsed4MXiC0pzA84A0E9j62+VyyFPOhzydCxXmb0+s1eYcREc7/vxrGh6Epw6fo3GycMVpwxAUteLml4A2C/7LCT4lt5cKQ4JZi7GM5qpdOCa0NqQ5YxgRrftJfQArag0O0VTAzxkWTv1uhxycDhbRhobq4Vw==</Encrypted>]]>&ext;<![CDATA[<Encrypted>&LTpabyia7LjFJgPs/FV63kLuRdzxNaIYiG9GEtKyhlLuNZbfXB3ldIFT1N9Diwtx3p84DOz3IEwsIdo+QM9h43ZnergT45h1bfA4RdLt2dF2WCJ32yh2VJYkR6vIUE7bGdwQ3dx7tN+5VU+0RGR3kg==</Encrypted>]]>&ext;<![CDATA[<Encrypted>&6+Hrj6TYQzyJr8/RW5Hbval9nNCs4mEypUxYyFnQqE6EqHo+1Icm7LFzQVz14/T6it1qhv02dIgLcZ/Ql6Svrkw960XgbPfczjs3lnyg87K3st2w4gcY07RRWfcwGaMJ0U3+lK7bMA9qGW/oMRtK07U+qWTIW2TNLaIy5Leo0jwAgILGMyngGpfkT31cYeT3uMCBu2jy41YdSK0di8OzYOMdh3/pgLX9ML27rOF3BkK8wlyW1x1zGN3StxQ8N8muLduN6LJatlR3JGONDG9wkOgt62nX3HJiDLtMr9GyKvCCM1tSCz+yU8+lQbGtbMlxuXhFS7rGK98x3WHRsIUd0HS+Wphh0R5cKO0/2ZsgsIgkA0+hYEfbFiTbvNMDpdEmgbAe/N11XgMCtRqsmOpH4OeCoqXTOFgSkIZsa3z2sD+91WvtL864XUafSYHzzAfQ3EHIZti26zKRltuup6aj6EKPnqS+w0vvxsR03eGnUEyUnvIXQn6iGxq16qg1QBy0oum06+0MW3Lx/FFhm6UawA2I4Ow+Rs+PD8bdrV9wIbAgYkUrbEb/riQSeV9SegEGg+ZCxCXdSrN72yHUWH7+W+oCCoo+3XdjoS2m2fTT7UtnCvf37ZHjIuS9B4BWudEmshdstK+yxgDEIiNbVqnpw3LqytWhmRyFmGh/Ve0af5Garne9EUMwTW31GyTJP5kCHjJkRry/TeEz0FOfJSROtcQKzb4hER3eznFEcj2B4gaxqfFwjE6sPGsJEKuQgZcFqg8GWgSSRP1+YtACsvAej1Tiy8U06gqoUPR5vRKV5xQyqwZpH1bS+wCFC39jT67euVW5s1ks8TTpkWYCEAdl+yPqALb3y9qKtN4RoRjICgA8pznHZScpav35dfzV+AStWtcp+CahmgvMjQ8efpB6MSP3kfBRRLYv8ydrnEq7X+v+OFRmbippzHJl1s5AXf2LW92+eGRpzDPSgh/2as2zqc7bMkgrZ+Vb0RkUXlf2s4GkGjccIVtFj+ga2Z/zgI6UvFEgVLpstYzKn4iWwgGq/QMSKMvAOrMAlA/HjhpW0vk13seYmqacX1vLiTuryDCU9PLYWWQkSDr1QThcnYUuR/64MELB0jYjURNM6YsArWgCgwxfmRlPlKxwuevAZSfyXm1jpWobBR8iur9a5QIMH+6Hh/xjvVF/EwbG90+gL8zIzPnulLvReqaEhcIDY6N1tfrf0sUQ0QtFWEWV+NPcrXWxBhJWQMS3MU8NS/rR914RkMKgEjXbBgfwoJOdtNV7RShHn0OoGRS9r58a26I/XSc+Z8GEh1ejwMIAMHrqwSyAVrIZ4QgFZdb4qLoeVocN6462NJwUEz7QX8q3mlZpfuLFGnC4G2RvYfwl9cRupgsy0WOp4iDzpV4YjD8YNl9Jl7wY2mHhzRTqKAi6CaJ/VajfkxQ7wsqonbm2Q8fHIp6IM5Vw+/v8KDjAD7NWDfoJbouUPpyyohKnfs3K+mthx54Huz8E9X590rHnpJhLvCtPPOxUEyIZ9yUCay6P6w5R5w6NbJKVsb6CnM3x/0uFee0gkbCaLs2vmNdUu9mn2E0=</Encrypted>]]>
      </text>
    </action>
  </response>
  &ScriptFlowFilterCss;
</dir>