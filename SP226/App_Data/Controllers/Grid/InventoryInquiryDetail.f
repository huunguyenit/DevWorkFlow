<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY k "xtype">
  <!ENTITY Url "~/Main/rpt_cttkvt.aspx Script: \'passQueryParameters(this);\'">
]>

<grid table="wrkin" code="ma_vt" type="Detail" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>
  <fields>
    <field name="dien_giai" width="300" external="true" defaultValue="''" hyperlinkFormatString="Script:">
      <header v="Diễn giải" e="Description"></header>
      <clientScript><![CDATA[<encrypted>%wLn1SXGDs39WFPeKEFTBo7YC7P10SsswLb4nllo3/uJJNre0h23v6V6cieFNl8WDDF7yeVIctZcoSJfq2TH4wQ==</encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" defaultValue="0" width="80" external="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="xtype" width="0" hidden ="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="dien_giai"/>
      <field name="so_luong"/>
      <field name="xtype"/>
    </view>
  </views>

  <commands>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6mE8/Vazz1IneGt1ApULwXuTPKXn2El58K8QFxoPUsTm6TV6vgjlZaLgp0dvn1jXH5K/8Rsbdl/grkaKv1PcQE=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Il59G/7FCLg8/wSbezIUx48ei1fHoBLWOM+4hX68E0KeGNnObI4wyqLLo9EHWq0rFimmFa/nhxV61yTJVRsmSJDnMA59SiEK+aTG5sDcWJGSamJNbOMXrVfy4XmRoP1VVmyZigwXHPU2eW0Fwuk9fM2uxvkJBb4FRKgOUk5DhfUO5FSNsVbw91bEgdIeCQADWEE500qLAqc2XUqTqe70SMvduK3On0AtAAQvi6TPPld1/Mj2/u5YwRY0kyITYqMyoPx6kn/y2h/5SmbveYta8NAUWZ0k2S/y8muetDk2Qg7Xr2WnT5K1A/DHVRWwYWD+MP7nUPVG98EI9DS0Rdh4cGt9t8AZRMQ1DTl5LH0dVitxSovdcjRpWb8W47jkFtj30kYnuzfQ/yLUJrulDLoqGOXIUw3v6X4A7EjseNYnpB3tw1LlmqmRHki5k8GRu45VrzOZ+FX7daP2+5+AQidSKzGH7+NkdgggdMO9S7J51T02txM7BPkdzQadvdlH8UdFCAcjpuFJjTC5Cx7qd7/Os8ifr891VdE0rPOyvX4z0EdVSn2LJHB9sBJL25n72ZVyP+SXMP2oKpJmk85y36vY1iFW4nnVf2OVkDNOGrqYHdblgxKfEgtSDjxnAC83B2SLYuJIpLHB9TjJiDuQlwBIJACGgUJrSidaKdhHl2TmdpTSGYYpqHtZaQLOonRT5ZDU5ENmc6YfxKQZzhNvHifLSq4WrQ/e5JS1z7GJBa5UoZlO54P6bhfCBGKdjeLiWY8RE7Oy//VcOv4WWc2h2JNR9kl/6XDz7uacbPcZjIyknKk2qfHB3ijn+S5On7syl79aHzOyZ7p1bVM3fFBqRDK53/YP/wkCn5JwGpDyCDkwLPV85qOpN4TK5eAAAYp4ElEKAO8QyFsKBM6R1Lgcl/VVPBFvC1gpBaxveNnguuLblbe</encrypted>]]>&k;<![CDATA[<encrypted>%vMdHXolbLTW9Mxvui/rqaqDUxv/NdqpfoTNcRtLfj5mrrhtziAzvQGY9cWY4DRGpYmE/ZGj2t3hcaEx9cOqayIr8xYPgIhf2EnP0CrrWBdk=</encrypted>]]>&Url;<![CDATA[<encrypted>%vMdHXolbLTW9Mxvui/rqanyQ+nF1bsyRYEGx43LDg+q20NfXXXcGPiMKo6LlvwgxrJr1zy8zV5/fW/HkObrvKJQ5Tm2zlcjcU/9Em5HhGahVruustEZ5F+2Jn4o8tWUTT1OFbMV4QCG8wKRAS25k6Z4IWA6r+uKgS7TLwKExvfk=</encrypted>]]>&k;<![CDATA[<encrypted>%vMdHXolbLTW9Mxvui/rqanNu13576OeZwm06DAO8d9NvoeTGacVjKVpdZYsGPZ+jKo4OQeRY/O4isCKt5vMyQvd+t4vrRjxHSVCvtPreE6CXnxdhVJz5nOn9vi4i/Q1RYUxOE6Um64hEbHfj4HSp0sa+zlmw/gpRv5l38O6bVlRXcQ7PUHqyKQVt2wtMU3YwxNdgwYujqVJnqO6+M9cyUU7yfxtOFjZRWCMSvBlEb08yTq1BIuPaUxkW5L6au8uucr/0psRlAGCv7D0n7W7QJBv2Vc3pBKCfNtoghVDYp6N8qYlT13CgkDiTIVa5mJO/vTDqEcnHjmubdyVl3huyxSnjrnIcJP2DQi9iht+F6MBXEH7Oo/T2q64zmmByybF5pUDigW935twdmQQrSyKusEkW4faet37jETYv2GPM9iE=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiExLtVkBVPa3+PH+l+AcUSEDr7R5ZxHR2vRwg3eKFA0GRhvmaLERa3iMfdu2Sly1IA==</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>%QUk/b2XzXW4SkIBsdbQxEwoR47PS82RSBUMSL6qjeOS5AgAoEpJ1BcrE28EXFyCvQD4XYklEORKs2PTY+WaqDAMW3zxJP2hfAMOQwgelkxM=</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>