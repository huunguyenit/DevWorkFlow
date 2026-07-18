<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY % Irregular SYSTEM "..\Include\CompactMode.ent">
  %Irregular;
]>

<dir table="dmdvt" code="dvt" order="dvt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đơn vị tính" e="Unit of Measure"></title>
  <fields>
    <field name="dvt" isPrimaryKey="true" allowNulls="false">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt" allowNulls="false">
      <header v="Tên đvt" e="Description"></header>
    </field>
    <field name="ten_dvt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [dvt].Label, [dvt]"/>
      <item value="1100: [ten_dvt].Label, [ten_dvt]"/>
      <item value="1100: [ten_dvt2].Label, [ten_dvt2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1e0TIqB6MY6u1Xk5Csv3PGbq0tbAopjfFHY8zW7wUNuMyo8JN+p1nCm9A1kSYQLNhA=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI0P/H+AZcpPJ+89k+Mq/qc04jIStzOUROSvtsOFlK4DYDg463ga3wUgX0G/CGU43oVO3PduI2p76XW9W2rpEfU=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIwaS6ACvBtbFKkH8K44onDq//wP9L6RECYZlDoAlCwfNQ0tJklgx+nVzMSCx/bD+NpwMgiWvEACVCBD0UKveVy4skFwLXvmIHBi5HAg1pZz9/yMze2/OQulEDgMwos7HVuGOIPc18oL6QSyQ7HmHw/YNs0jdeqInQO8kvrkwtcK8h9VGej2sr50c6Ygj5AuMd01aJR+Wv2nOjxjZUMBMLIJuRPc1Uyab43/OBWYIScnnu7EBq61HCw0D3WpGZg+yWyhGdbZMkPV7bgaxF62dLCNHrJsIq3mwiet2F5JB6MHBzJIAx5Zy9b+uSDBw+yFdXr/UgYZ82W1da3/nf0DmAnrECLOEn3TzK0uYq0eNyIH1xPu58KFKXygYX3yGkmMHYDkE/s9EJQcyVyiX1f+7hCsjIYrX1CAtsc6bkH2RSYy9yYtKc1CztGMzFAK0HyOM3sPDpUndjYesyleLyKb8KbDzKuNiH2+V7UX4b1e1BpZus2qZBmGriSn+hRl5/91kM=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUXxNLDL3c/vg3yJ5f10zyzvs0/vrV7VQFj4iO1MPgcXj+kXTj+xAM8MZ+Jv2ypfDwjvg+odLdsIMt74oLOKdUcY6UiJBM4kMfgue3k0oCvhD/RMupHaRzu9TjOCEzaLDvjQ8aXURnMCy8wEkALx4e9kITN6ShYuWau8xXCEMW9Od///SU9ilzzieVnMRjolTXgVncaQFq89Jg/Nl2NAPJtg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLd/IoPNVeqgewOOEm+VhuYte2x2vzLEF3gK/R4wFZgTDrcDQ3Nwlqjk9Oe7NT8Z5VZOXrsqg2Q6LmTNIZrOurqLN6bKaNuzjZwmgG57A0V4zajDBNAvzP/88lRpApQldWMLF3LcHoFi5dDNSN4Y5hOMs1/ih/d+ub8HHIZOzs2Dmk8WbybYGX6kpFQt/N7JL3pgzHgkp1Ux0E2dLLN236xFbq6pJX9DlAmAG0am06u8ikcNh4v5zjxp+EWuLjxmjT/rQ3taN9taHItxp3RU9VU4QanewJuqjLbljP4OYdSsw=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVwa92o02DsEse2bMcQHp2fmE+WgxtQn7bhQSC+NcFqFq</Encrypted>]]>
      </text>
    </command>
    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayhVWUyIAj5e6xaV/QXdIYE82xO5KU2zWlLRaYMXuynSAw37Vju7AE7k0kmSnqnGlS1XG3X8l13tT4/47oBDA881umL2RGWeJyhjfrL3wbBz4cAqQSWM9hDoYZlwAOb0uld8SrqZBZ77p9J2p/3Jq8/</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtX4MkiZSUMFDrj1h3/Af1nMixgZJsHGQN9ToI4cHhZk9OXi39OXwIL5Wi8hAG8+jPzeqEoy+FTw4p1x4EouSO4dIAGzhRmrWy6QfQiSb+/cl/Y0uR0O3qixgh9ogu+DJq4hFlwc2t69ibJuyisVSq9ysVjRZKsGOF06zbOzKcfH7ysPy4M2NNGT19chLETWM7TjMnOXemw9oq30xo+UOQRLiG9WRTYsiLkQ/6QRX6ehk/yH7+iztRgj25xqkDNjnoaQIcUqbvhXa/c8eKfJk6N54RIYlEFKK25yjE1ORdbTUlL4CoGycnM17oMbT/cgfQg==</Encrypted>]]>&Irregular.UOM;<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyf9TO59P/UyAHIK1KvU8kEyUpE3yGa+pdYhu3G9sjWPeVsWTbQ9ZBA7PpmEOYTIopA==</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>