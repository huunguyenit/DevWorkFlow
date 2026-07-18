<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="tdmthuetp" code="ma_thue" order="ma_thue" xmlns="urn:schemas-fast-com:data-dir">
  <title v="biểu thuế toàn phần" e="The Scale of Flat Rate Tariff"></title>
  <fields>
    <field name="ma_thue" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_thue" allowNulls="false">
      <header v="Tên thuế" e="Tax Name"></header>
    </field>
    <field name="ten_thue2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="#0.00" defaultValue="0">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="232">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ma_thue].Label, [ma_thue]"/>
      <item value="110000: [ten_thue].Label, [ten_thue]"/>
      <item value="110000: [ten_thue2].Label, [ten_thue2]"/>
      <item value="110: [thue_suat].Label, [thue_suat]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwepAA4o7celyx1ZhNzEp9n+ueg6vH7v9aoM+nRg65cf6dTXB8whf0amvIcU1c+20tTnNe9F56TN6q7vEy8k2MF2</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9y8HfIACjlf89TMwV3NRN3MEEW+rjk0j60vi05JI2jnL8v6dv3mc5l59/KV1dEEVeI41psUy7F52xOkg4QYdFk=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI7lMPQHdMINJSk1a+Yh4TGBCL7MkIH1urWs9dVvTPkeV/pyo15MybS27YYbXeY6ZFNz2KFcBFIZagBPQ+f7sUemnM4CNMqJXi1ql+iqE2F6KB/GDiFX8G/PLVkJytltnAmz6NDMxUB8BPru/i3zP33K+tiGm6mqfYcrG906BX52glS8dPnZUtFo+RKlMzhJlEsvypAOj+bP3+c2xlMxJCS6SXzky8KWYN0po2D4T5z1ryv9i42ltccWjxF5k9jxMEDw1X8srND7W4rFmmr2b7hVujWKmWsHuwKlS3PpvQIWLrJTo99rKJgQy15JYq4X3DHVb+kPBC67IMuuA2KxGs4tZHmZ14qQq4Qs5nmw1TO1hRvhQRdhqxc1WkNvUnm+2PD0vDT/AUGu0e9h1a3J0k3+527twy80B+cIEN3zkCmPiy5Blb5ekJcw2Qdx3Dk464cmN3vTi+Af2o5ETb1TIQvBWByRx9qzc8O+Z6sI5TefVprNgROuTpMCs6dVtzQncoG/otvf7FIdn5T7Xww6HxW8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nDLbUN3Mpdm0mffFQ/WSEHnJfUaFBz1g9esxz6hj+J4zZb59lG/st2aV8s2GXSMQKL5NunQBwSXEgbCcsNunmB7/HRNaWyr//N8nfjhIWljmhcX7NHDU/nPYQ/S5D7jfrJJkzIlKUD74W+AI0gww8l2blCvYpZgXFR7nO3wdAUkj/97HDYnb79OXVKgyYQYCAV3W1z0qIce0FIsYh0A6KGz2De5v9inlX8y1k/xs+zI0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jiBJ4HSxTxgjkBChEGiWd0JKTgkdu4bRZnVGXUUPD9BBEkQoPlhDJmGRXe7ytKNGs4yjvHuX6IM92InqtPn+462bHB5kUlyz5PTah/AJd1AyraT1HSIzsS6wElEeRypHcVXqFtmSRJQ/RRZI6r5Oi1T2BOyN4kBPgi7JWwLp8cL+C3A40Ir+rqmk46lLox4/Io8FKOKpsfUiX1sICB81LdKZfibA2Rd4vvi7GDSBQ6PwcdDXBHYVtNfUSyaBtlNl7q1ZApGqavjeenP7dVpqOCMqYmsDDSFvvgHCruFOPS7hHuUDRPfPSF3732+l/vb3G</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqC1ZJMuOjLAMDaUuA56ed+7qqxFmc7vsVqv2TexodqW</encrypted>]]>
      </text>
    </command>
    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6disk+IY5ysJK1tttDDkuIi1XXQQmsBIuqFiIwvbMua08uWMfxjaK6KWaVwiFbG5Bgre+YshzlmHalD4svcCBbl11dWS+S7Y/DxRYsdurfORCdp9BLpe3hrd75C3xXk/6qdb3fzJUuMtnf1LGADz10</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYuGwliclJ5gWjhSL7YLeeJQhYQAtG0V23wrh0YTDX1rIjmDqCRu8YR/21qgQA+oo0hQSLUGaFMRgG2fW0s1gKAaiCB8dY2aZ7KYbdu68GfVchszYBsBRI7Lji4FRedfbn5qgSyqZuhh36xGw6xHxRM5t28PpDPK+h86nXGZEC0FumY/HnB/hmzPHcHIp6k0VCA+Ou4Jyt1r5tWDsqFuYctC2nJ2BdU/KmftqnNFYZuwL0WHcWdjvMR1b5ir1Ajtcyr1pzkXRFT8rbLhBUSStEprFNa+nn/Mc124P644xhIZDB+UVZ5oWTVhMnVnKIldeeUO8MRt4woR9srJMa1pE0D</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>