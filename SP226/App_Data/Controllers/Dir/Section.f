<?xml version="1.0" encoding="utf-8"?>
<dir table="xdmbp" code="ma_bp" order="ma_bp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="công đoạn" e="Section"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã công đoạn" e="Section"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="truc_tiep" type="Boolean" clientDefault="true" defaultValue="true">
      <header v="Trực tiếp" e="Direct"></header>
    </field>    
    <field name="ma_bp0">
      <header v="Công đoạn trước" e="Prev. Section"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp0%l" key="status = '1'" check="1=1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp0%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>    
  </fields>
  
  <views>
    <view id="Dir">
      <item value="120, 25, 75, 330"/>
      <item value="1101: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11: [truc_tiep].Label, [truc_tiep]"/>
      <item value="1101: [ma_bp0].Label, [ma_bp0], [ten_bp0%l]"/>      
    </view>
  </views>
  
  <commands>        
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7d3ECgDXDjU6kGoMyFBXKB9l9pbXYTVTTVVqEF5zkqWMdzvUeTPdbSCZFJTtmZbAuWWL94InxWGDpg76YGQGw+cX0qi02JqY2726LCpHlGLgv5G+V7a9c1lRSGNHd5dOYmrOJz0eVLbAAJxfRGf8UlHKUdz0oI5VFFFskeMqu2snD1SEtbuxQ6uCUUi648xaYysRGDNu76gEyNSnuAUDFYMDUncqYcopTFTrPegl1bH71SDPQmXw3Ay47F6QbDy0QYwk5IhFK0TjAUu9UF25wDWyKeep1srBOkK6SZGKirmHhbfkfBs+5QPf+sl5+h7qe44JJ0089lDgf8SLij1V2d6AaE62PRrobfvF7Zb+QSCWNGyjktos818ibSqILwaVb2OZbfL5tyC0GAAX8Ts40J7OAOob0JfzIzlu0vyHcyvGQ==</encrypted>]]>
      </text>  
    </command>
      
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nfXhuiGxtx5ilNScGK8aDj/gaPT6XsQe3KalGvQju+Gxth1P518u9ujlfZpxf0mBSEd1CEgJfSCt9ISCms7G/mLM1wfNnRpcCpU2v752jL/ljjy7HFZI22D7RyxHu6Ln75QhmZSQvW5X/9tULtN5bMBFODDCT3fGogauHe0Be5BemB421BdVX4zCmM9KitcscXIhUeST71B/PREMoScOR4r/nbXiuQr/muZLGgOkqVkEV/FfV8oMN01UIfoga8qM2vThmhYq2v55YDT9g7ggKCMLaqY7TI4YB+3YzBUAqGE0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7oiyrZ54YCO3uUKZXEdKQJYt6cg96LqXn6hMP/ssOwPyJLowUVWJeCWvDRece/73Hv8=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jbmjLVEaL5LOirB19XEEBSfcZd21UrWxtcnnihK+i6/6/pPKpRlRf4qRpU2BI2bFOMlMPyWUbPI6nGPeIW45Fozk7khp2BNqJ1DYVTX+D0l6p8Q4GYzhPEPcRm9lj6etYZGxEYrLnuzp7z8srrsv61rkh9gx+O4u1MUzAHg3GsZJ61cZcWPzRo41fatP6/pjlDG35qulTF+27IV4fREJgcPLe1Q9TdCvuZWAOeFJSojcdiozNCcsw7ydv7WtpKdnabr+wES0+goea+3hYgtyN7w==</encrypted>]]>
      </text>
    </command>
    
    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6byveN3l8BM75NC9Do8njAjWFGmWtMZW49sSzY/Yy4V8ibMPa8S0uAIqJ5zAj/5PiEd2Hxq89muVLQ+OO/AYAPBFToihVpqo6Slesh33ay4+cTIZD4ni6DX0O7iWoGi+Eip9Bjq6ARy0+Oj+YeL+JtNCWownZV/eqwnV0/n9rIJwqT4aZ0CVxZp3PEXOKVTZpLnIh6c7kNaB8M6ItWKdkaU=</encrypted>]]>
      </text>
    </command>
  
 </commands>
</dir>