<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">

  <!ENTITY Identity "CRRequest">
  <!ENTITY c11 "Ngày chứng từ từ">
  <!ENTITY c12 "Voucher Date from">
  <!ENTITY c21 "Số đề nghị">
  <!ENTITY c22 "Payment Request">
  <!ENTITY ext "57">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'CRRequestFilter', 'Filter', 'CRTran'">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5W7o5umcKpiFri6ddCftH8T5jxob1TbrUExgCkPz7jhOa9U8vhhM4Qv40gtD0co/9+adqEkEer/k/oeGXHhITWUeFJKP356Io6BpweNHza2V2EBHgAeCZxKJH2FXbF06IgBZg+m7Q60h4SdfqZW3QonNA5ai5NYLloBtKOTdVht9nEW3A/KqAJmoygOnMGejeHgizU/CvOwjx+kmdU/BV0zbYV3wXGxZ1CNxEKqmHStIzBnHXYVk4Vfmv7PIIOdjE9Od0TiwrM3IQ+awv8ke342uw+28OEibEM99z9ypcEBLVKek0UAAo3A14iY/0BRFA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3nefBIr1BdWaeXowPXKgZP+aWfAoW+/JzITmgw11l+81e4DwCZRrnqC+KLfXHp89Vw==</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWKVGgbnW3GIrrFsajQ/n+EYQpoJVBtzgnAiPetExqsBl5tYKLqp2r3GkcNo8aTraNQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJcga5U0qJ53KLHq9qyQLk7xfjGlF8rLTvfZLrE56dnToHb8zQXfqC1u+vKc/Sb4EuLFyf+PXhLpEMXYcPPPjSQH1zR14UY0F1yjLzfjQYN8q15JDr7M/JI4TO/db4jxBgZSxpbHM3j13yCh03vVHjGEtuULoFHQFFGcdYrTJQbiBWyBYnUdTC3EkGyNKU6QYmyqSkAnDKjQ0fdNRt/xeax2ZgwmfRTEc/vvkeADmKXm3g==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3n7fMSXuy2bYhtxguM4Jm5kWeY6/iurjaNyV1uNgdYbtZwSFnqzz8dGMhV04oRPbCbF6yOneQi4uESf9zTxZSrk=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNPYFlJSA13tHsIE/Q6nVptg/BZPfqTnRrdAqWCr4NRkunOjY4/0qqFVEAlpXfYd7UrzOnO5GY4OuFVDtj2fK3RA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/xJy84fIiVuM67+XdUYThJdDvcSPqSsYiR8HjlxrTyKS/QcbMrzDZcy91CV2WQ+9osWHzpziT7mdXsRP5+5V4FQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq7zdDIHNFn6Ro5j8ECt/ahr99pG7IUuOkGR9qMvzfy4skecorHnD/Ja0MP/97+ZitolYBy7JPh0staIMZYiYRuQ0MrqzhuKjcIUHrbw6cSCOa1wUDkf4erlYqHQKmfZnkU+tS4k+lgTs0ieazSWBRe404Y+XD06saAsUO/WsF+GspBpwHFxYBghlKCRtPeVvwA+ICO6K60aTy/1OEAKhpciP+pei1W00CqqoXfb2hM9bdSpfYJDVhLaK+4mjpM8AI88lBxDPhiYGPjBcN53on8IwZ/rzLlp4iXfgRPBDZJGqgTTBig88/7xtXtde123oZ7eDPY6gU7qCC75XZ9qIWEH3xIhSgaOYWRiJ7OBcUa5s=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&LDzAOPHES7tv8KSHmKXl/22S31RMBdET7pdL1a3M+0TbpgieR2TYNVq5qL5uQq1EdBy93H+8yj/cbS8QAKnHnkeOf05NZnbsz4tWZiDN4abzXKq0k2uiJx0hxfyAL8KYUZDur2yjpupGXWdNRo/d9TxPrRLxy+5szlkx+WJjM8yCo2QzxwyXbbmDz16qNqrLCKUa2Gfj6P6tl/YzdWd09I6+4E/H4IUBwthMSKsqPMyxEkTG/fLiEOTf0zCvEBNoz1/CIU5EFU8nS+by2R1OLIxl/nFoPfeaCq2JfEFQZ4sHRIJUeWbU86nqvmkRgkd+gBY4+WsXp7FXuOxW+ztS1GUBak8t7o/zT6hD83Os2BysLmFU7LcS7c/GaTVyy5E52JDeMSjSqgbg5MFMtJ/3oq/6Ct2g2vYA64bbvBvdMZhTL8Xo/aC59NLPQheYS3BueGdsZsJ50JP7hVnQeZBcphC334eJODp1sv+3myFg+steOOf7cwHwetrAZjRbr5AA+yR6icvPSG9b9pSl0uzJVWnQYeMKlFH9Jt2OhUpDdogXEX5lq5cnW2GbiuCHkRQoK1I0gB3RyRnlKuXT8dJ/HtWka/WRnkFsBc3BBrosASqxp8Br9pk39jIRDcjHqrSr0YwvV6rXys7CQmAfgnpykABY3H5tce13JFrIsbshCaW9Y7NN8Iow7zIJubJ9eLO/rO9eR2zfZFdcWmSsDNryrF3OZQ0kpLFz+QyfU0iN2dIyjYbnoFmuizKImyL3DJRtEddT++oomlHcnxpGWayJDBWierlZRjjJDe7sztAkjdM=</Encrypted>]]>&XMLHiddenFields;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5e4LT/B3Kr/RGRU3/cW6avyMSEn/oH0N4yL3g+/3TtKckLZceW7MYlPXyibbPbluW0cuGdGJip0Jt+7mRpCmNDTlAtDg5gmBAnU6xiBbpXvhcVhD51XBN0EHJIGzZp/qLwNuh3i7LlfUUuy83woAw0PpPzgtHb88mxurrXjDQJwHirfb9AsceWbfYXKeT/pBhKWbPsMcKz21mc7DOjAmm6PanKnw1eJ6dR6d1/BxoPaiTwAs8ukf/Ed7Dyffaa3Ga6ijHr7pia1s3peeqIGnfyAf4PlHEi9J+zbzBgTt3vlCLb0lkp8sMIsoshYCBAvXoFCQpzmjTtnPmhjlRrtNFE/IwpC6VOTR1mL142E1V56y8I1vfQx95AnP0aFMc1FzQd3v5bIOR74/nfip114u12Qpb1R9QbFNaayt6IYA8SJDLrKIHRZNudJxWBEKIK8jvW3BObBOtGbnkKIURsLlM3bbbSZWQfMpQAzgOUE2+dpl4LZqCn+0lYTjXjWFilBFJYaKyUiUBuaXHGuneR6N3dcNCZnE8kjZwBqRyy57nhioXoB5Fsnoxsf85KdUIvZBafjX2J7CFyeJh0es7V5PCrEbJOW5PE08fS/9JpsrytZu0rWdtBtXch6FQD1TEYybhJDqW65Morb3Ni+pdk8yA88HqO6dZoVjXvhNEFSS0WB9</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="PaymentRequest">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+WzIv1LIniksQQUAPFwtU7/CF8RKdd2wq7nQS+uFJsPTgK9TeCwzxoNLydx+q4FAXKaaSfafsk+14b1QomaNEnxo4+XM+wQhFCimM0gj08o374LPLcW5fEXT4KBiz65MXFAYqC2n8UXEu3jZMg0JZeNTvWDuXh9CYK+7N1rjF4Rpodq8UV30NfGzYwpNO8k+lmYxz6jLvNn7wB2iCixEoFcL3CBnS07rv+7dckqQo04RLhXj1dTu8q7vei+FFEUvtCeV+/0/t2yn1g8KCvQTtMGqf3yFW9InrA/pFWYNfe7/z3HnKYwDKZ5J3cBb8klWstLYNPhKVkgdDpeh6JAV9+QRzHg10ySikhUD7/2J9rBaERtCiPgXIoPYzdZqu1ZouIpKfZ6j+484wN0P/+QAU1CMZgZz/Uz2J3FIMiVc1h9oPbe4kr1gZZXbD0CUK8+RNy8p83odnjAXzsPKgLOM4pNZrZEwEA3N7jbfMCFdiQV</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VeBXrvz8mne6Qr8RsKX5kA3dxNChrsXq1oSK4co+WI6jNinasCYdGVtedCDJGzYIdCDZkMsNa0xEUWQLFwYE2UzeR6zEHPJpROoelEHwShyWoUo8ZItIYd8JMk4rv03h5ScmVw8jU3KrTzzMDXpKh8d7Oapx0zjozYSHzxzQfb7ypK8NLlQw41cGydrt7RBt2t3l1Y7VBrB/gZ7kM959638v54OJbxVEI8zotLT+Y+9e0YRQ6JYDFvDmwliiH8giT5qVd9IVYj+PWMMvsjoSRUkGaF4A3WNmY7X6Bsed4MXiC0pzA84A0E9j62+VyyFPOhzydCxXmb0+s1eYcREc7/vxrGh6Epw6fo3GycMVpwxAUteLml4A2C/7LCT4lt5cKQ4JZi7GM5qpdOCa0NqQ5YxgRrftJfQArag0O0VTAzxkWTv1uhxycDhbRhobq4Vw==</Encrypted>]]>&ext;<![CDATA[<Encrypted>&LTpabyia7LjFJgPs/FV63kLuRdzxNaIYiG9GEtKyhlLuNZbfXB3ldIFT1N9Diwtx3p84DOz3IEwsIdo+QM9h43ZnergT45h1bfA4RdLt2dF2WCJ32yh2VJYkR6vIUE7bGdwQ3dx7tN+5VU+0RGR3kg==</Encrypted>]]>&ext;<![CDATA[<Encrypted>&6+Hrj6TYQzyJr8/RW5Hbval9nNCs4mEypUxYyFnQqE6EqHo+1Icm7LFzQVz14/T6it1qhv02dIgLcZ/Ql6Svrkw960XgbPfczjs3lnyg87K3st2w4gcY07RRWfcwGaMJ0U3+lK7bMA9qGW/oMRtK07U+qWTIW2TNLaIy5Leo0jwAgILGMyngGpfkT31cYeT3uMCBu2jy41YdSK0di8OzYOMdh3/pgLX9ML27rOF3BkK8wlyW1x1zGN3StxQ8N8muLduN6LJatlR3JGONDG9wkOgt62nX3HJiDLtMr9GyKvCCM1tSCz+yU8+lQbGtbMlxuXhFS7rGK98x3WHRsIUd0HS+Wphh0R5cKO0/2ZsgsIgkA0+hYEfbFiTbvNMDpdEmgbAe/N11XgMCtRqsmOpH4OeCoqXTOFgSkIZsa3z2sD+91WvtL864XUafSYHzzAfQ3EHIZti26zKRltuup6aj6EKPnqS+w0vvxsR03eGnUEyUnvIXQn6iGxq16qg1QBy0oum06+0MW3Lx/FFhm6UawA2I4Ow+Rs+PD8bdrV9wIbAgYkUrbEb/riQSeV9SegEGg+ZCxCXdSrN72yHUWH7+W+oCCoo+3XdjoS2m2fTT7UtnCvf37ZHjIuS9B4BWudEmshdstK+yxgDEIiNbVqnpw3LqytWhmRyFmGh/Ve0af5Garne9EUMwTW31GyTJP5kCHjJkRry/TeEz0FOfJSROtcQKzb4hER3eznFEcj2B4gaxqfFwjE6sPGsJEKuQgZcFqg8GWgSSRP1+YtACsvAejxlJaxeOOgU1fYExhhcl86g/aN3OGW9DqIEOsHmKMiPLLBk8+5OfJXoDb3HCnxcemtZkwIVHF10DLVtqrooGG1CXs4L3OueE+jP2C8wFxt2ZMQj//B8aiDcdckA8G3Te1WzI9vdQWd9W/BctaLHtjZwZEPA+0OK3w7Sp/XBBXrUNGu5gN/jg7Y7VXhYl8wOcWDo5QBMYha1muNh8CKwy0b7R6hjzvrAcQYgiqyTwmaxdgQPgkY665w8O+Zi8DTcuwzHWoDCdl1EAevSN64oDV7SmGjp55by4cKhBEYvr3LBcm2ImAYL0zSSODUh3WMWqSyItAvcBDtCGPVtqSvUKHzlOEkdrbnIHXHypIrP4S7VAOx9ZedyuxWLP0tcvUWnjqg19E9W7JGa4ivRDGgYJB+8tGpnfHsvwaz76z/CK18mPAB99U4ke7EfmH2nKm8UC6Nko1XifvJZfv0LLcu5+XZ9/RlWs5teh+Wbe8ZipspQzW6RYloFKqJ+sUnZGhyoVPTYobapA/pghsOfnoEXqvDz07RIbK4bW50VEnijCceXrD/ZHgOLn3Dft4Dvv3rGARcAlrpx/wDeM0dOH4P4zH6C+HZG3T2wOhM3aMkp7nmq3Zd/dvch+zJCO5iAR3xrm2ihC0F5/qK8NU0p2QayOzo1rj0kqD4pkEmVSPZqfRkS4dlv4BPFMcDg+A6Keik/uvBgyl9zWsqBbyj9Pxd1f795VPB9O/mjSkUKR+KjEY94feUJTLINbhJ59pu3LsZDGAHe5Z6k6w80OCpV6QHGxIwY=</Encrypted>]]>
      </text>
    </action>
  </response>
  &ScriptFlowFilterCss;
</dir>