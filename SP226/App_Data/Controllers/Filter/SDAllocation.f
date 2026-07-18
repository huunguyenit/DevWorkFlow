<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "SDInvoice">
  <!ENTITY c11 "Hóa đơn từ ngày">
  <!ENTITY c12 "Date from">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY ext "81">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'SDAllocation', 'Filter', 'SDTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn" e="Filter Condition"></title>
  <fields>
    &XMLFlowFilterFields;
  </fields>

  <views>
    &XMLFlowFilterViews;
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5ouhRwVDXfM701d7VDswpeWAIPmqLrh5K8vWYTJHH+uYHmNFJSjilb77qWdmnjXYvQMPDpl6ls9r5CYV/BJrIzI1ukXBzhu7CUni4CTj2SrdOQHTIfhXD3AvURNMAXNg7s0f3B0nJ3ZdTbO64CsN+RtXIkJiebE0mx9gYfQbmzAo9s3KUKvhEe3/1JGPB8lkIy+l4q0rDBiVX6Fh7hPLlwLDB6xWaIov6myMYzkJ7S/NLkrQ7R/e/1I6Gz5LUNt0zSH22aBGcyzQN0AfIhR510FAk2Ocb+xKcjhYms5qBEGb0dYd3EqRk9BaF8ctg1du9kDF1yy51Tt0Q66BIIvNzUmtzh629QTE30u84SPccGZmxwl28n2eJBY+uw7J4NKFy7vIIkTKRYECGKs/PFqBRc=</Encrypted>]]>
        &CheckRelativeProcess;
        &XMLFlowFilterCheck;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLGc3R/qUm/fdG83yyi1hCbqQ4Od4jG66bN/n2fXfoB0l5fmQCcUoPhzjn4VzMzlbhiV5sCmo7NanI/iFodwYCJxgPvPimjeNlBDk2eUGDvJ6t9tE5V/sAc2fsop+MzKW8RqQgiuTaUW0XSDvD3mu3RPAPo4mn+sopxZn4NpILrzBWQzssxTxfxRQKVnDwgNUMKTlSqHGn7Pdi73Vo5cillebeE+iFmG4dZDNYTK1q3noeN7bwYcr67D7696WUtDRA=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3qeBZQhxWm9N1jRkDfSC40OHkd2DXY0N0S9OSWHXjUiFW+QJt4fV8dVINzErNnhRZdgmMtp+5Wi+CtdIuC9Swcw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNzr5CBr8L6XnwsuxeQoiUffsWo+UJaxSPxz5Na+JgujI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq7zdDIHNFn6Ro5j8ECt/ahr99pG7IUuOkGR9qMvzfy4skecorHnD/Ja0MP/97+ZitolYBy7JPh0staIMZYiYRuQ0MrqzhuKjcIUHrbw6cSCOa1wUDkf4erlYqHQKmfZnk9w1/Unn8W4vqjcCNwdND7rubhL1Kax4+htjZez17j9iu3zni4Y9+xbhE4Rtp8u5DUOvHbZ1O1KPG0kjK3QnTXeKWfJ0x9Xb1+kV3CAqsR3RQ7C8aGCajzQ10bCrJuf/bZi4j5ruZBswP+m2Jt5sqHT1ylMXJfBHQtj07KdL/MMKKw+Ts7Pj17c6kmkcC2Bac</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrKMYCHssObkBLe1+DexzOpeJKZo2Tj8MjD0aribln1RX76VRnHbuBampiZEl3eZuuqwWP9snEq2bOlSznv+eaaNgQihW12mpZYg5/t94WCT6li2GuQFba6bd+YLVYVwO323j3gMIiJ9h7r5QoHAYvxV2JPi8KQesIDpYwo0ELKzoYka+Ge/aoAy3R7JqxC3eKZdEY0OhneoRoc/XcmqqEf9g+HRkjNIUSlmLv+AqyWru+L50QkFFS/ntGT80WC+2IcSWVs6RKfPb5dAv+x4Lk3cXPwLQEscja8e9Gfd1wUYnzGW4cV5hCtPCNbX5caZnle/tkb1X39Fe239t6hewSUpoF/Yo04V/j+34IOeiAqI2/OJ3lhK/7TyScXueAlDFVYZ44vQ0FSEOkGlX57j8Sn6RLPaXfiIxeJSL1w1l2Hq6j81vPZKfFGEJFkDcIZbzgeWhK0pKSDUTg7alKTkiNFKJ8yzeI/0mccfPjr3hYwh+e7DoDgOuQF98M44HMntLun5b9jxvbdF7IWqT3UqXLQ8bR4PrtO9OG62nUmP/ATlfvgDf3w7RHZn3AgTxtEXJEFKhJQvwrrXLZM6FlfNW2Et8Ld6x0A5K1m3rVFX1+1zJMmbMmpfu39xvmsreuioAvjv2vH59RldBdRFJOVrulul/qetKKNJUzCB0gfAlm0ccdmNaTMq6yfrwfFCjPdpK74OGD5SxD5F4JYkM+TbDn3t</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>