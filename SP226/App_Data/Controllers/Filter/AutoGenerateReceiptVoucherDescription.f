<?xml version="1.0" encoding="utf-8"?>

<dir table="options" code="name" order="name" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cập nhật diễn giải ngầm định" e="Update description with default value"></title>
  <fields>
    <field name="val1" maxLength="100">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="val2" maxLength="100">
      <header v="Khác" e="Other"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 200, 130, 0"/>
      <item value="1100: [val1].Label, [val1]"/>
      <item value="1100: [val2].Label, [val2]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzMQHj8JQ8uczzqWwIEq1/nM6xroWs0tA6M+hi9U9z8mF1inAfmct3QrGT9IvZgzQ4F64v4RNbKZh2/un9cBRj/kbzHxeP63fnP7JC/mPtubT7CvCOnOzAuujKzylChPIOyWnIu6C7VpTKWuUI6nQuDUgV2q4KkSDu4DlytqvrdH</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7og5c5/M0MwKkRT4+yWQjLqYTQZqH1o3ipb0qWBebHL6kIUjwt/TJ0y8ftyWFg1k7phLGf0AgTtsBflRNNABdyCVB/qtaFhPKtUSqgemjSrl9vW63pbiHmNMtamAxne4KVPcbRyPH38x2A4j1Esq9vuL</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FIbnIBvcPJdeg7CGPVF1Lc=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzZb/RLZFlG2xgWZwOWiWmTl5h97dQTlHoD96FhAphMzjSPPOfbsrBkjntpzvZsEqa8k8Yv7gThKNlKD0fs9LnP4TSL1TMF8o4537ppU5SrX</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>