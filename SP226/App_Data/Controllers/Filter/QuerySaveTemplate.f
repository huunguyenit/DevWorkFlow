<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lưu mẫu truy vấn" e="Save Query Template"></title>

  <fields>
    <field name="title" maxLength="64" allowNulls="false">
      <header v="Tên mẫu" e="Template Name"></header>
    </field>
    <field name="other_title" maxLength="64">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="is_private" type="Boolean">
      <header v="Mẫu chung" e="Public Template"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 100, 30"/>
      <item value="1100000: [title].Label, [title]"/>
      <item value="1100000: [other_title].Label, [other_title]"/>
      <item value="11: [is_private].Label, [is_private]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzbfMHAK5/527khHL63L/DzQFV/xBEUXgXleBRLyLIwQCRZPnRZmAhRU3BSRNuE+wU83+MOUhJwXgXFxrgzD0Z47eRbXzq0YE09BYDamJlUg</encrypted>]]>
      </text>
    </command>
    
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0/ELKHll8CmLZDxLX1FoNbNAvZYbfGrdsQxOovwwTnC79VYtQ5/iMnXVgYgsLUVIhS+X/1VCMQanloi2W2ewIxwir/tRCdQ14PRZNbAfP8tdYj6yujw57w3aSm+h/WJqf7zgTilYbtfDalG+vdi7Za4gDdtEhs8BbodGo0a7GDRtKWvm75aIzAZ2oyalo+afIImeIfOX1QfUH4JgfhfixZ2QOmh7qOcNG+RsL15mdTHrhDXxBqkuKGeiQKwKWZB/xc=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70J7JUyyaDug/AnyV05Kfct2DaLPHmWfgNMFYffy0Ivu/2nBivzqwhkFbFoE6yOl8RlawTZ29Y41kLehput9KJs0TeHgbW7MAEXQlqGU8UDtaX1yUoZmdyuKNlY2yoEhav/srOZtDAZnF0G+jJefgvXuJT2eAZaev2fNr4f4lV0IzduMBQeyCde2KwcdYwv+RP6EWDLqUznKqELm4TL0YRNDxQHh2N50IJnvXk86NDC98hnPVqXnm8j5PqNfekiv5/NO+aMolowOheIJd3ICn7ZECw7znJGyUeWv6uvleK0mvxVD+bDWNOo9XwMMz5OvKmw==</encrypted>]]>
    </text>
  </script>
</dir>